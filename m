Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46111349CC3;
	Sat, 30 May 2026 16:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157838; cv=none; b=RCE//V+AZmuRPWckJqhIdIK83zsRbgza1Tmyj07hBe9+jeP3xMYc8RstJkOsYa9HBeUMFTnNS/vyUUZpPESHJUrDoNFJZuZf1W7Ohwf2EY3FWCRri4hho2CysDcA6zjn3yqEU2t5viAbeGQsWjbt+ucbYfLBUMakCZXeKvESDEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157838; c=relaxed/simple;
	bh=XcmGcv9Z+4HBQpG/Hrt62KoNcvCjSeBp4ctpHiPspTw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=evJHysFIIzpFCHTpYmCUz4MPk33kuORp6YcxFmdT44Uwpbts33dgmlqfqifs9fxHbf0heX7RXOyPX729SKQgAu9YStDPZ6I0EtRo/TIzKXD6rZG9Sbs2dfETnGJDHGE5c5DKzZE8he9sYlRh8/0/+RVaoYQzsJxH5Y4E19HQT9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D07qaGMZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D07qaGMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FC01F00A04;
	Sat, 30 May 2026 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780157819;
	bh=sWeqs4T1ZfczzI2AQirYqbNrq3gKGb3MvNVA+7pVO1k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=D07qaGMZDYvuxOpqNEEt+os4SCAHO5r2qo6LdLfO29E/9CQf5gvvCAZDyVRVSiZ+u
	 hrHOH6trsVEMIl0K6HzAYQpukidz7taMoCf34vp5msxnkgtt7EL1oi7FvAt7m/3Vo3
	 W4ItHJaFD+YkZ281w8BdJlMDMbpjEvvi9OswFIX9UIQQj9L1jS9T0eVcxp6N1J8QmD
	 eCOqHPNJx6JUnrqKlcdVTQJH8bN+rhTYhBJyVO5E02n6ydLAfTU0TePftUR3x86DzE
	 GBgxlfwK5XPjVY2+SrfKPwiAEIMsdV/0VfU9lUvxuQKQwpKke1eKqOCiZ+Ghrc3tPU
	 nAcw6kIsZX+tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56857393021E;
	Sat, 30 May 2026 16:17:04 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 7.1-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <ahrKJXlzYYoQ7vzR@kroah.com>
References: <ahrKJXlzYYoQ7vzR@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <ahrKJXlzYYoQ7vzR@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.1-rc6
X-PR-Tracked-Commit-Id: 645d4eda1d0db0202ed8e4a2c3abb2ebce6b86ef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 670b77dfebe7257adc0defbc48a4c43cfdf6c8f6
Message-Id: <178015782296.2653560.15816922998928525947.pr-tracker-bot@kernel.org>
Date: Sat, 30 May 2026 16:17:02 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 30 May 2026 13:29:41 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.1-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/670b77dfebe7257adc0defbc48a4c43cfdf6c8f6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
