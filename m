Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEF03B52F4;
	Tue, 25 Aug 2026 19:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787687507; cv=none; b=eYGqZrETaa90VSe2zYzdr8AfEFOoBYzmk3jVShcZBi2yAoFoICMR2Syri8xV5Th9awa3n2ehlgeCCljBn9f2SHjOnxAoeCmOnQoNIVsMoZ4MceooVOtHwZ+MzqZ3bPrbOSau7LjD2mPSfZ2p2mh0blZ3x4ZqUXIoxtzL/cTn34M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787687507; c=relaxed/simple;
	bh=XhaaguO0xDBUDCeDT4fZIm4iZ8xB82AQCkqECwm+b3A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=eG3eBYut01jpntA8Z4tV/0KdY2UrSeqd93fNYNYIh3aXfFWkOeroW/HeB8QA8073au4B+hUqs7zXa4DMGmIhqexkUZPrQDOb0vyPreFIgtoh/FnaCCVi6mAIVUiYK8sk3ejbaHpEFHO/Ev17Bml4Du2mG3cD2hFDMaqyUrysPf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZA9mCokp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZA9mCokp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0901F000E9;
	Tue, 25 Aug 2026 19:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787687503;
	bh=tNEWRgBQcWoXD/vAiijQ2tqXtmMM/DRTJw/hKV7aL20=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ZA9mCokpZBihTAPmIOGIBPBwk9XspamOwbTu18CSf9xDvT5ucb2bjq7cRk/eupYrK
	 +NITPlZGJn6edrsXJuLsOyRJ550zQTLXH4YSAO7PcSy+UbkMU9Vm6e9rEbCEPmBp2c
	 wxdyZ01nWfxn02GBVzl0J/x/ZyMBF7cQV9pYg9BqnV1Re1/tm016DTA9pHxZ0/tcnY
	 s+uh/vZBx/uzZ7gfXTmEyg4nV93wYJhydRTTHBkav5hORC8oGnFNDQn72c/dgMFhYx
	 fTuoRy8bycIS7qCGsxBbDdAuYzk3OTviH05KnxadnSVP6EpswtP3kIeB5n8pLg3fgP
	 c+cvXRZAk1NxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938AD39253CD;
	Tue, 25 Aug 2026 19:50:51 +0000 (UTC)
Subject: Re: [GIT PULL] USB/Thunderbolt driver updates for 7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ao2lTODMw1_aPWRP@kroah.com>
References: <ao2lTODMw1_aPWRP@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <ao2lTODMw1_aPWRP@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.3-rc1
X-PR-Tracked-Commit-Id: e1e6e541c5c9cf548e9fdc35fc26808c82074440
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f4d50813c0958b7d6bc79a7e0a77193372cbfd03
Message-Id: <178768745006.4034242.14668110468680079944.pr-tracker-bot@kernel.org>
Date: Tue, 25 Aug 2026 19:50:50 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 25 Aug 2026 16:23:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f4d50813c0958b7d6bc79a7e0a77193372cbfd03

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
