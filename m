Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809543;
	b=ImOxbxl56bkrCCEgvszcAXaHV8cVnF83aRn1WU7OFA8OBOWaQPECD+G++HWNS9CgLTGQ
	 mfdiKGik8FCrstOLkZ6cjzCyAecRVK5PJ82eeubMF9RE/nz+X9qwzdbdUVncEz4QnGFHY
	 l82gJKWSB/JLilzA5ErzyHEmh79bUVN/AGLTJaAYbWmONII77DjfUSZniYC64JlZkoqaW
	 zP9oFG3R5jBiQN/BTYzSH3JuZBhPjnXZEe9lDy9kVgm4SzI5cfDFaiRfrVdtqXatdSvCc
	 esTUOxq+VH2nRX4iCM7dUIc1X6jXLleNlitFwhQB/po6lcklnvdHCWKIxGxjhUMrqwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809543;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=wwzHjXtjjrvLN5i9xk4oxAbfOBQcsomjaePViXXdUdc=;
	b=NiZQLOCkXqjfxuEmxAgSvJN2cADMbpAP55VFMkuMXmcd6ck9sEru8u0iSQsdMj6I0P+2
	 NOGsUYj3GcGMiZhG3f/wm9brJeBK/eBAg0Q4Ldpg95Bt14gI0Y8nMGva3FL97k5pJ8syy
	 aoRLe4BAcHlNc3EGr9TCoCdOPEFoa+NsxM0xbEqX4BNuLiX8JUbV3KsLIzTSfXFUNdDpl
	 o/Xz9WpqCTCvYKsZv+sXiliVELWcE14OJBTN5Vybwjbo7JIvqLnSK+72TO3AZekPpMVoF
	 1ACLS9PeTzwfSHXpQmDCaVonw70uZKvg5P82zJyGngxRutdIQ5sHn/IcFdH+LAnpKkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZhsIUqEi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC8A606A31F;
	Fri, 27 Nov 2026 19:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZhsIUqEi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C4D1F00899;
	Fri, 27 Nov 2026 19:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795809542;
	bh=wwzHjXtjjrvLN5i9xk4oxAbfOBQcsomjaePViXXdUdc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ZhsIUqEiyBZK2RrmbH0qc2vSt2lXUYubNQ00Gx97TUyEb/nKn5XhQZhQ+KlMa9Mme
	 C44smiEBfkipwEBGRyNWvAp8l8LmaUSAKK9OE9OYSHWlkfxltYItMAmGkHiJQqRYCo
	 hGco14+P3kd/HPbx4eBFoRfy4NKZOtXxEs0MmvOHe2CJejcTHdKa3feCGgZZfU9W5d
	 N0CHXCbGKGcVr5qwVE7rVyuq10aatify6yU0jAXf8elMJUF6HC5XUIqESrVC/DQlaW
	 fZsd5sUEgQSqasGEkpYe0vvfKyktQHZ2KHhjbZXmsinAKjr05du5me+VAsBWgh6p3l
	 hdzR6VhxHFxYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71765392705F;
	Fri, 27 Nov 2026 19:59:02 +0000 (UTC)
Subject: Re: [GIT PULL] USB/Thunderbolt driver fixes for 7.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <awmK6gaXd1EnO15l@kroah.com>
References: <awmK6gaXd1EnO15l@kroah.com>
X-PR-Tracked-List-Id: <linux-usb.vger.kernel.org>
X-PR-Tracked-Message-Id: <awmK6gaXd1EnO15l@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.4-rc5
X-PR-Tracked-Commit-Id: 9aca49d33eb4191a95c57290360fe8732b639025
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7641bffc3721f0d1650e52935369ec7f7bf84126
Message-Id: <179580954095.1663999.4286325719131656326.pr-tracker-bot@kernel.org>
Date: Fri, 27 Nov 2026 19:59:00 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Fri, 27 Nov 2026 14:51:38 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.4-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7641bffc3721f0d1650e52935369ec7f7bf84126

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
