import { createFileRoute } from '@tanstack/react-router'
import { Show, SignInButton, UserButton } from '@clerk/tanstack-react-start'
import { Button } from '#/components/ui/button'

export const Route = createFileRoute('/')({ component: Home })

function Home() {
  return (
    <div className="p-8">
      <h1 className="text-4xl font-bold">Invoicer</h1>
      <p className="mt-4 text-lg">
        TanStack Start, Convex, Clerk, and shadcn/ui are ready.
      </p>
      <div className="mt-6">
        <Show when="signed-out">
          <SignInButton mode="modal">
            <Button>Sign in</Button>
          </SignInButton>
        </Show>
        <Show when="signed-in">
          <UserButton />
        </Show>
      </div>
    </div>
  )
}
