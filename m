Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0964F31F993;
	Sun,  5 Apr 2026 17:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775409245; cv=none; b=h8PypXWDXw4MSNY+8GO2OjG7rTUI+mwdsiW2ioe01UQ34yrKPevj+RelAlbeZTJ35caDmzubLWz4IMgNtogxzcGRCqLO/eOyeof4egI5+6yDoWcU31vodnc6PVEhy6slGu6CDQgFwaL3Fe7o9eOmfXnt9pGkRwdoyG8dhLcK4v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775409245; c=relaxed/simple;
	bh=Je+oNwfxlTofI7hUoPQogA7Ase3zecuDpDixGi3btTo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=J2ATw7m5ewqrKSpBV8OSpIrfvY6cIcFbQf8g7MvnDXCzjkfLw7f3eK44P4KmWPpF2tehCpB0aE2KgCmA7dPZ9RKRy4wVxPkcZqmwvMJRklYv1JMfDjgK9hJVS+DHXfGeKdseILs7jg3ZztQP9DQ6H3lTGQiPoI9NHZYEKZjOvEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBXHz+4+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBXHz+4+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2EDC116C6;
	Sun,  5 Apr 2026 17:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775409244;
	bh=Je+oNwfxlTofI7hUoPQogA7Ase3zecuDpDixGi3btTo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fBXHz+4+VmugLQpwFYnE7hSjAYhN8t+tILTcbJtbJSChTR4mqmmwjB18NCOXKWPV4
	 zcWQGuqRQ+LQRVq30ffnEhCG9fbnxe5DeiPdmHpLaPs9pDVuygJoKkBT7S7du228iy
	 xL8c2MAwB7Y9xXXMLa6/odmkCHuWBQRS7/welN3Afbtcw7szbazT0vcLn91fPNriNg
	 prBs3oXxSBZpZVsZWh9F+SVlAijOoBpoUcdu/bitocUVMNpBI34JWC35uXbHrm2VIe
	 xxsffMsbMFyqR8WmUNdoXfbaUk/DGSirjqFapX6QjTqM/PSq0IYJ5Fkkz7SPwn9ryB
	 hthZXRYNju3TQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F233809A22;
	Sun,  5 Apr 2026 17:13:45 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 7.0-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <adIdzbVtDh2g5Ofo@kroah.com>
References: <adIdzbVtDh2g5Ofo@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <adIdzbVtDh2g5Ofo@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.0-rc7
X-PR-Tracked-Commit-Id: bf3781a35c27978341c31f59f1460dcaabf2e726
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aea7c84f28f1117653f7443806905d7aeef13ba8
Message-Id: <177540922443.1998626.2504968737030407042.pr-tracker-bot@kernel.org>
Date: Sun, 05 Apr 2026 17:13:44 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 5 Apr 2026 10:31:09 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.0-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aea7c84f28f1117653f7443806905d7aeef13ba8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
