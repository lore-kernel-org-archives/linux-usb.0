Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0274037107B;
	Tue, 17 Feb 2026 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771350897; cv=none; b=jOotih6e9RBY+QfxikllI0ZW88T3Yipky/o7ZoFYGE4mbqTND9TrMUFoSqcBeKPI70fhwooMT20xIQFoajgb/uqfWfphf4V8aM7AxHLWlHse5/E6TM0jS+RFhlOL/nTeHbXtTIwCSI8EFR4F9zXTU2KBLS0Z0OXdmLMKEERsMbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771350897; c=relaxed/simple;
	bh=5xEnzxfdNyCEH71Qv6E2my+6056F9Ql2esFwv/S9A0A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=i9BnvVkkWNRr8oYop83VH0b/Xw6kFNlXAMnLHGaVDGogkFXPwhTDjTTSfDyig4Frp1bB/9ssw0eF73aKUqA0tx7Y0q7ux8w9LupLQKkpsHRT69D4EemctPxgHSzsDx6cEcfbdeUmBSePaaxLK9hZ6JG+tpWgrfnyZySg2bceS6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=co7Su6oo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="co7Su6oo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDC7C4CEF7;
	Tue, 17 Feb 2026 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771350896;
	bh=5xEnzxfdNyCEH71Qv6E2my+6056F9Ql2esFwv/S9A0A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=co7Su6oosQnqAxENW9bjCysfbvixZ2UN3yR2BvXlEVv93iq9CCa4eszPM9z95xZ6j
	 sLbFUxXJS9gxWZzlb6YnzOGI8aRH13i3KmZJEDIN+iNSNY6pOCH+aMBGqQotbZt21u
	 tCzQQKL4GcU4fxowmeq3MSoLUM9AJqZRT0xwzwmAXqRb+YEfrsx8We8rR1uRfVoBJ5
	 22QBmHJxxeOYka0CKQAuWyeAIDCFjzXyoxvENpFWNNjpmOQDqI6D4ylFGmdK2+DGjs
	 n+9oWSdtou6GSrfw7WuigRfUND6b0xN1UH1U1tTECd29yFu67Hg6mC0eXf8LsLFPga
	 nTC8Llz3O8Apg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B2A7380AAF2;
	Tue, 17 Feb 2026 17:54:50 +0000 (UTC)
Subject: Re: [GIT PULL] USB/Thunderbolt driver updates for 7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aZR7eYewulF4M0CR@kroah.com>
References: <aZR7eYewulF4M0CR@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <aZR7eYewulF4M0CR@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.0-rc1
X-PR-Tracked-Commit-Id: da87d45b195148d670ab995367d52aa9e8a9a1fa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 17f8d2009367c3da82882f70ccbdca9f8c7b5f20
Message-Id: <177135088865.577366.13376706444658954406.pr-tracker-bot@kernel.org>
Date: Tue, 17 Feb 2026 17:54:48 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 17 Feb 2026 15:30:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/17f8d2009367c3da82882f70ccbdca9f8c7b5f20

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
