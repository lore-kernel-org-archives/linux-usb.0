Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28A43812DB;
	Sat,  8 Aug 2026 23:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786232777; cv=none; b=XYS52jWNXaro7ONWe8VjV62YlYHGPEzCE9XSyoRrRc9ADBqs5phasi3Ccft8Hqed7Ea1F/+kI7vL+qyxrL5zQYwIunXFabJgxQZrmApeq1hxBSqVg/RtXcrtkBs3Mlqp9ymxhWPVegRr6LwQ4l/h5jX8+b5aoiv38TGllDunSOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786232777; c=relaxed/simple;
	bh=FO+bk/wu3dDPe6r5XT7YtEFIT+uwfvKhnk+T8iPCxVA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Z2Dwe/b+yEo5tPzEQemNNXGrru+8waFNXfudDjy9Ieg6mvjT9RupeOKysNlGNKGlmfBxtVPhEzoNB17WAzH5VGRBjXVaa0CfFpfpnCkneGYTMdEDGjw/gjRfqWmZpOu40CBJlIJDs2uW/UnLR1RSMrSHNS5qRGxW4aH8ZzXMnjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqElTOu9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqElTOu9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB571F000E9;
	Sat,  8 Aug 2026 23:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786232775;
	bh=jMO7eQEw0pIKKJ/5yhzgL/+Z22znR+Pnegm6UiZoUyk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=YqElTOu95lu1lB4qGfyU978uXzkr9U383h3e+8XcB5B8qP69qBTzXHqwJfS17MGmV
	 rb0zYe3jBQJeZtjMCyrt7cmDmth6MY4iTqQ2mGyH1WBoS/T/kxpKOD8fuL7gzil4Tb
	 YuCGhx3AaFRCUvvbMa/vEvu9jI9VjnsqasIfu1zGL6jPGyC05dRGCLwRuxcn6ITQRb
	 C4MKrkUi/L4Sk9iSoQzY0HTPgpp6wj/n0RK09mMJgZu7L3gATNSrHJf2XMiJEtSSqd
	 fKP85IyEh5Gj43VP1s2Qf2hSL0R1AtwNicJvAUqQxLFDBbTIq6zpx7j5DYbV65a6Mf
	 OOTSxrRq77Ftg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9393B380CFFB;
	Sat,  8 Aug 2026 23:45:34 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 7.2-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <andMCv-BUhm2QhAf@kroah.com>
References: <andMCv-BUhm2QhAf@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <andMCv-BUhm2QhAf@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.2-rc7
X-PR-Tracked-Commit-Id: 3d26cd1f3ff25cebd10d4b0e8188cf40dade28e9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 91a73db6970aa7cd3d2ea73a4a11eeb3519737db
Message-Id: <178623273331.2786584.4060930206368962745.pr-tracker-bot@kernel.org>
Date: Sat, 08 Aug 2026 23:45:33 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Aug 2026 17:32:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.2-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/91a73db6970aa7cd3d2ea73a4a11eeb3519737db

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
