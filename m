Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D7834B410;
	Mon, 22 Jun 2026 19:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782158356; cv=none; b=RdP7wWbKSWrsZuV0Uy6CYbSOIbJyhmhoG6LWm8WyLh+5jOmgQKQBTJ+jJqid/5Z/hiUkgCTP9nlgLfY59qGe/JEU1Rexb+C931hUJdVT/Pm9Wljfp/ijEMRbzyJ+PH8/Z2SFyuCWqbVVxA/eCOssFu1MEeVoG0bqVe6R+CepcbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782158356; c=relaxed/simple;
	bh=pAfFfTxdnCf5/yp+jovw3buMgAuha7KEvm7zWX/RGUI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=n0vu86yWGdH3kjwh8Cx4q4ArDYpW1RglgH3GKcPh/8UvCt32Rao62hqq8vIzUU195X5/Cs6SC9XYR2j3W1PxoKBYVjHpDm2zgO03V6USlM88Bgay2yZMCOKC/hRPMZ56yiA2/5OYtWLhhPd5NjyASGdwNBXVegolagqWeW54hXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/RpkHGx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/RpkHGx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0FF1F000E9;
	Mon, 22 Jun 2026 19:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782158355;
	bh=Oc+T7qIkOcz7xAU5kYm/B+B6l3yo0aj33IBNp02qzVQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=e/RpkHGx3tbpeFkUmjoGnS5/4RllPV17bvs8bNmapf5WRTLnLF5ctjRTJIlLdWLfi
	 NB3kUeV3s4EI2K+Ywsvw9D6NWNwPfaiXvBMrIPtizbtt2yGK4NpS18kebTn/3xAPOc
	 BPlSGpWO5m2LwGyGQZeF93LIgM/V34wJElZ2RbWRcSu/cTfUuQFifbGeI9IU33WlTX
	 JTb4ZAT+9e0F0Pko64Tx/gOYf3WPRVhQs/gYGTh3il7G/KGj5qMAMbu4ukjKDYxZdR
	 NyalEbScnDFDAL9278CKN9bQIFt2qh39r6CT6MMk3PqqbkkF1D4uP9KhltE5wWrgAR
	 TpNac8VsbR9Xw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0D083930922;
	Mon, 22 Jun 2026 19:59:06 +0000 (UTC)
Subject: Re: [GIT PULL] USB / Thunderbolt driver changes for 7.2-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ajk6F7wN7SNpW82A@kroah.com>
References: <ajk6F7wN7SNpW82A@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ajk6F7wN7SNpW82A@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.2-rc1
X-PR-Tracked-Commit-Id: 1c2b66a7d7257d2652aa41f9a860ecb96dde27dd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 364f4a55c661641c02c86a849f0608d8fc3c0006
Message-Id: <178215834538.1395317.13448414042335535899.pr-tracker-bot@kernel.org>
Date: Mon, 22 Jun 2026 19:59:05 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 22 Jun 2026 15:35:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/364f4a55c661641c02c86a849f0608d8fc3c0006

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
