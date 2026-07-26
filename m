Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CF75464D;
	Sun, 26 Jul 2026 20:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785096046; cv=none; b=onwwnO7ACTZZOmCALXgM+6Cwwd5EvFbi+n2dujCtO75g0V+6aJmGGsRjx5saQGq25TtFMyCdgC6z7GYN9I7Xo7bNrjqvcdnmbkaMtnKT06Wt5kOjLm1l9kEJxZZyPMSwWkxfkgHXK7PBL7T2CYdxziZBNmwCV0IcbC5aA2WX0do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785096046; c=relaxed/simple;
	bh=D5ickZnaBVDoKkDyLqJe/mWqNbAeV5shsqHQ+bUwggg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mKQjBriqgmU7U/5r7Wms5Z1oEDqFiKVwPmPIucn1mQxgVGD5gEdohnXPRVSh/9dIn4k95r0yArP13f44kUjVS1XDepToUc6uxaZzsfzCs04yepGBrKKSQ5Ds0wUwAb7GYC9kB3lyVdwA9nC/ahpNdoHyrxHxp8cgw0tdBCSu2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fL5tV/RH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fL5tV/RH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6521F00A3D;
	Sun, 26 Jul 2026 20:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785096044;
	bh=HLwe6NeXF6NFEtr9IeerDiHQBmq2+zjev9n303CqtQA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fL5tV/RHL+TMuHc5oqI+Fyunm7PPtRB58/VPTgLa7maxfEg+vKIsj5T9mVXWKpuwT
	 jjL+v1jORYshBf11J44tK8qXUJcuPbwhkWtoYU8iJyXjhXS/vcvD9ukaFOes+l4gWp
	 D3lVduVkUTcJ+oJSIo9sr6FlBr70upwCyyLvWA8YeF5L8MZNSk3OYAa4UOyQPFibDa
	 Kn9+ORxS76dMxjggaJAuNfAAxdRdaSSHxxs9q03Kb0QITcrAfoVDo61bTq9hSGAvxS
	 o+Tj0wLUfUu1HhLssFCs5iAxgwBwSEzHnm5iX9C7EgFroGjdZbHFCheb2+uHqUMmA+
	 BtU927NeF5NjA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568C038119F4;
	Sun, 26 Jul 2026 20:00:11 +0000 (UTC)
Subject: Re: [GIT PULL] USB driver fixes for 7.2-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <amYFFFruzS4L7mQH@kroah.com>
References: <amYFFFruzS4L7mQH@kroah.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <amYFFFruzS4L7mQH@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.2-rc5
X-PR-Tracked-Commit-Id: b6061b6cca72d6a20f5eccd72b8da78c2e460861
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 79ba9db003f7a58cdd690e809c7f298380dc5082
Message-Id: <178509601005.3839324.17829198095070919422.pr-tracker-bot@kernel.org>
Date: Sun, 26 Jul 2026 20:00:10 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 26 Jul 2026 15:01:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.2-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/79ba9db003f7a58cdd690e809c7f298380dc5082

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
