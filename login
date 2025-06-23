LoginPage.tsx
import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { useNavigate } from "react-router-dom";

const LoginPage = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const navigate = useNavigate();

  const handleLogin = (e: React.FormEvent) => {
    e.preventDefault();

    // 🔐 Dummy login logic for now (you can connect backend here)
    if (email === "admin@artisan.com" && password === "password123") {
      navigate("/dashboard"); // Redirect after login
    } else {
      setError("Invalid email or password.");
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-background">
      <Card className="w-full max-w-md shadow-md">
        <CardHeader>
          <CardTitle className="text-center text-2xl">Sign In to Artisan Connect</CardTitle>
        </CardHeader>
        <CardContent>
          <form onSubmit={handleLogin} className="space-y-4">
            <div>
              <Label htmlFor="email">Email</Label>
              <Input
                id="email"
                type="email"
                placeholder="you@example.com"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
              />
            </div>
            <div>
              <Label htmlFor="password">Password</Label>
              <Input
                id="password"
                type="password"
                placeholder="********"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
              />
            </div>
            {error && <p className="text-red-500 text-sm">{error}</p>}
            <Button type="submit" className="w-full">Sign In</Button>
          </form>
          <p className="text-sm text-center mt-4 text-muted-foreground">
            Don't have an account? <a href="/signup" className="text-primary underline">Join as Artisan</a>
          </p>
        </CardContent>
      </Card>
    </div>
  );
};

export default LoginPage;
