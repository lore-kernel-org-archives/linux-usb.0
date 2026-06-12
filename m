Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC365405C49;
	Fri, 12 Jun 2026 17:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285806; cv=none; b=CJdlucUzQhckcuTZCrrvGhHyyzwPIsoooqKTSDVTP3tDMXEfc8uwGrESvqTvT3Aytb993jRxY3JBHXKErVCLBAG+eGZLFIqQ/Og4bLxWwycF7RpK8Ln3Z+nbR6VqfAMHqarcy/VKtZ79CIOr3MOLpAFZZmuHBDXvaJht1LHdebs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285806; c=relaxed/simple;
	bh=+Z467fJjKF1uEb/k8pvfkZUNxr0itowISLX8DxVb1M0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QUfUeZS+Kq7FWT/9XEhpTi+qd4QcX3jZ4dni+XUaU+xb51gKWtsdR09YXC+6pUHtE4sEK2ldKZDce9/cY1l6T4p9PiKeb3RCjT2E9hDtq1xacevT7ay6SjiJbMNWr6Q74PiGkVDMiQdIKvahs3wPPxL0dB5HjwOd1lWzcvdc/CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGvQoO6y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGvQoO6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F3C1F000E9;
	Fri, 12 Jun 2026 17:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781285805;
	bh=e19mEWYGJfSuMnFNNG849yOEIYBbgQoZFqa6jCjwO18=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=dGvQoO6y3kMMZF+haGyXDQKguM0R0BTj9c3D5DPjxlbH44/SL9eFxK10opZRnH561
	 mwL/w5QuakYVHR5AXNaXTAaAMMdqVWNQP/ZtitPaR7hWUQwPJdI0oGYOrt/8HmBms6
	 19x/OnXVlDCR01dxfRnIhrYYHiAToXnc5tCC0ssY9xiO7T/inBk2nzCg+v5RPp1ZoG
	 hezUndTuTivAdbUhyAtwAQlmzgUR3+8PGCCnLxs1SH5gRjm1fivX32+LA+gvCfh90s
	 HfyXm+zO32gSLhFBjxv1H7XihRCPDtSSrkm0HNv1sdMT27p0cecZocNLvxFUrZjbCZ
	 3G7b+RXqrPSpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93C1A39D1D32;
	Fri, 12 Jun 2026 17:36:43 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 7.1-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <aivgIWiKBiru2YhO@kroah.com>
References: <aivgIWiKBiru2YhO@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <aivgIWiKBiru2YhO@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.1-final
X-PR-Tracked-Commit-Id: e47832c73b83ec21e67026726a1c8124697792af
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2e04e0961e9226d7e1fdd5bda3373289ba7a3f24
Message-Id: <178128580221.765808.10127090183053363675.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jun 2026 17:36:42 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 12 Jun 2026 12:32:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.1-final

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2e04e0961e9226d7e1fdd5bda3373289ba7a3f24

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
