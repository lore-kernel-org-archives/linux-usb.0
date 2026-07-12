Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BE635E930;
	Sun, 12 Jul 2026 21:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783891063; cv=none; b=keYpTLDaBhkMlTVFZFUVrAN79QlMcfpapKrdB2VaGc3G8i3TjHJ53eWTMLXWJTmy8RDmRj9q0/Bc2fUhJFfZF5OqlIZgefLD63avnjyqsoQFxbUFLCvsPtN9+xE6w8HbJcYN/phXY2Ny9KTAeMTSvJIOBULZxNMqhDNBvfpyth0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783891063; c=relaxed/simple;
	bh=DQmzNp/dOqe00XMrLJygVQNVEyySoLrTi0FkJyFFb64=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YJ0Moy1jbDqdGSOEPFRHfSBuxSYRWhNR67cLj4KN99Bcwczq3Z/XRmP3ul9rU1gvUh4HXxyWzeHB6vJ5DTqnXbERhmBkiGFba9O3+pngSWxGRe1GPzCrDQ/cHlphedaPYkAYk6brBx1h8Nau9e6MZAFAb3XvMY4jtBJQCxScJnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnFC8ucI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnFC8ucI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668F11F000E9;
	Sun, 12 Jul 2026 21:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783891055;
	bh=EqIir7WVzl2loooVDD443pVr2MdqYlQVskPfSDikpgA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=CnFC8ucIXSdUCVoW0INNxhxg9aeL6q40j3fzjP7Z146QJRrjVIrtg2XMjHppKB1VT
	 zDrjp/QzEE/igcQAVcQI0ZtOy+Wp/tb+Vp6eB2x/pTTdxaNdu6Hgjexj+45Gyruzhl
	 Q4omTlRQ5RH6VYMT7COQDeAmy3wn/tjOD8Yc6V5vL8IkTZ3Xo/C7lhkNccf+jHalDA
	 MdK1lr598cpjbX8tO21YMrH/8Zg+Hae2fawrxo5piqiIh3qkIA4XBNZ/sE3H9Vtx0q
	 onPcxN4Zft++RirDvIxQUWraSkfwymTiaEEmUxGEsua+CQ2Zo+O1J0g8q36tzypLai
	 cfQITmmrwsgKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B1339244C3;
	Sun, 12 Jul 2026 21:17:12 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 7.2-3
From: pr-tracker-bot@kernel.org
In-Reply-To: <alNTORt0auSDpDlw@kroah.com>
References: <alNTORt0auSDpDlw@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <alNTORt0auSDpDlw@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.2-rc3
X-PR-Tracked-Commit-Id: 6df47500b557e01737eef6f6b07b12f97a35d841
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 534f8f051e5e1cd9a0cb9e8e0314810f9f9dc069
Message-Id: <178389103117.1485009.9423593193161835937.pr-tracker-bot@kernel.org>
Date: Sun, 12 Jul 2026 21:17:11 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 12 Jul 2026 10:41:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.2-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/534f8f051e5e1cd9a0cb9e8e0314810f9f9dc069

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
