Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CFA2BE65B;
	Thu, 20 Aug 2026 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237744; cv=none; b=Ya6vV+BebLZsalKd6c8zDA5iPmkwnYmTZlbwMIc7iJyRn8a/2Pszi1maKCi/TIVazECKAXrFhfNyroGcn4gRtJuCMtkLc/t73ty8n9ZOcL1GwZoSxJM0ACrLax4QKrVVyWDx3DMYUAR1WIMXWapkbHlhqJVpU5dp2zKHhGFOOeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237744; c=relaxed/simple;
	bh=fjuwbyauzkXr/aLDUE3pjnGvUFmXrA/XXPv1XHL09mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HUvM/B/1Lg0ZMpL0Dln3B1OmiXx7dl9bwzMbGZt9iWa6PJo85YfBJrxrnep9TCVg0cKZPGJe8pstd0gdI0JnXQ/FBbzWKz04VRhNKn61RXVzP6v+E/9diydmNxZR8NFRex6mEUg4W9oGZO9CR13mdwPjGfyAkH9L4BpTKH91Y/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edkKfFUR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edkKfFUR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416741F00A3D;
	Thu, 20 Aug 2026 14:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787237743;
	bh=qUyGti3SdEAiu1wVyknmU8Av7cTlGYL+HesetXf60Yk=;
	h=From:To:Cc:Subject:Date;
	b=edkKfFUR3dvwmWQCoJ4Epn4jmR1I8UeTAH608XiDz1uw74uG1K8wDji7DHhESXkkv
	 H5TgU4uvb7cVY+oXSYNhF6f8xuK5fp/rlWosRDqNJS66ZSrh9J+TdddROWU6mc9lJz
	 vqv8juYQvdT5VSPNFIncV7JEUcsdvqQ1ERuFB4vA9BHuigioz8J6kS6DadSsPNchGx
	 vqzgvYGNj6Ehf9TxsRW2E4DQI64DWjU+LqZ5xm7I62whkZR9mwX++nlGAj6JN6LMY6
	 /W52iClbe6D97huFFxXeZjcaPVxDE8TAHovan0StqD1kFh+GkjEvlPlD+D1m5x5r11
	 xhQHRynxz87ng==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wx4BA-00000001p2z-42pq;
	Thu, 20 Aug 2026 16:55:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] USB: serial: fix port tear down use-after-free
Date: Thu, 20 Aug 2026 16:54:00 +0200
Message-ID: <20260820145402.434447-1-johan@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When addressing a port probe ordering issue in digi_acceleport recently
I realised that we have a corresponding general problem during
disconnect, but I didn't have time to address it straight away.

Now syzbot has managed to trigger one of its symptoms and people have
already started submitting incomplete band-aids so here is a proper
fix.

When testing the fix I also noticed that we have an ordering issue when
deregistering drivers that can result in similar use-after-free.

Johan


Johan Hovold (2):
  USB: serial: fix port tear down use-after-free
  USB: serial: fix driver deregistration order

 drivers/usb/serial/usb-serial.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

-- 
2.54.0

