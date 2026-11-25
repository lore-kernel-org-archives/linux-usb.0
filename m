Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.240.9.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617228;
	b=gb7JMZYhb5c5yVWyoUX34SF0o+eptoH3iU6YJAQYhC2SMHqepJIV72fsCtP5Jv3qV4Ob
	 /fPmT++5n18QU19TM3+kIhq3k2UEL0nFEvyUgWjk+OD+TKFkM/ApYUCbVz3MewYN/pseM
	 d154fOYRMzDKKxxWhCxGgwYjhPgsK+8VtfNtesJR28OgZJeqOHxG2r04dmPS7UzpdMuXk
	 GfrEbyTwIbYevRjv6ipmh8thdPii5nWwt+2ENqJR5kPQe8kNKMlb36v0Vx3mFbx8aftUz
	 LAV+wMzejWk+ggtgkCbMLyvf0B3a4gDxyPxa3NVGIl2me0J7FK+BiCuHiIhQ6oG3Eog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617228;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:List-Unsubscribe:
	 List-Unsubscribe-Post:In-Reply-To:References:From:To:Cc:Reply-To:
	 Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:
	 Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=w+t8OOEFcISAZYmYwlyu3glhhShF2kKRTPrjhEn8wA8=;
	b=Nlc9akHjBPN7CmHcS0xEMZ1FfX7Mb8SfpXT4k2554ykp36vkt2qWn5+6ABAOA4mtKcwW
	 exPOIwy3Gx58D0H2Y0eqjEl3wwJxTx+lAdjyJNmz7SApwAn9oNG1hVCqmzBD/ICxB9ZyJ
	 Lk5A0uLTOpA1SMaCy4E4Lfmufq2VV5QVOFk0e9WqL4Ca49xEAlKcZbs4noftfljO3hZlB
	 o38P9Ik0jIo6nQyiJw9oojbLXpRo5H/5EO4dOelb4Swo0Cez8oi2rhc39h6ds9zr9y9HF
	 UjOkxJxD5xPwkXysuehx/D5Kv27w98BNjta5ar2b4zB/4xaeCn+HpGxPLkZASHfACgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.grokbot.com;
	spf=pass smtp.mailfrom=mail.mail.grokbot.com;
	dkim=pass header.d=mail.grokbot.com header.i=@mail.grokbot.com header.a=rsa-sha256 header.s=chya7do5z2af6fu5nhnfk24jer43js4a header.b=bjHP368d;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=hXHmqDdQ;
	arc=none smtp.remote-ip=54.240.9.33
Received: from a9-33.smtp-out.amazonses.com (a9-33.smtp-out.amazonses.com [54.240.9.33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41CF606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E41CF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.grokbot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.mail.grokbot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mail.grokbot.com header.i=@mail.grokbot.com header.a=rsa-sha256 header.s=chya7do5z2af6fu5nhnfk24jer43js4a header.b=bjHP368d;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=hXHmqDdQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=chya7do5z2af6fu5nhnfk24jer43js4a; d=mail.grokbot.com;
	t=1795617227;
	h=List-Unsubscribe:List-Unsubscribe-Post:In-Reply-To:References:From:To:Cc:Reply-To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=w+t8OOEFcISAZYmYwlyu3glhhShF2kKRTPrjhEn8wA8=;
	b=bjHP368dprLysHndoHuxecYevWsfQPtdTAY0B8fCJKGYGzA1//1FhycCOrUYpUrb
	k+p1Z0WRLkEGfXceBdLiuLXXNkafgzhF534Zf9xPpgDvP3OZgdk1WWypeyWiQgxn/hK
	dJPrPv38yMKb+5XBorFnzUlt6vhDgvdSHCbbKK4bva4Rwh7YLIaFvbyqQQ7o/AJJR8a
	wRolMxUOYkzuzIlpzQ/rW++9iISY7y1IjFcY294JFQxDQXIjlD3Cgnp1ZD3rMw/jo8D
	IrgMN9ndAcLJDsez/VYS+6kqeRQlgXCvmUJ4yajShENyZVkB79BkD0ajREj1d7U/zFz
	1cgxNSZ7sg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1795617227;
	h=List-Unsubscribe:List-Unsubscribe-Post:In-Reply-To:References:From:To:Cc:Reply-To:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=w+t8OOEFcISAZYmYwlyu3glhhShF2kKRTPrjhEn8wA8=;
	b=hXHmqDdQXb8LyKlTg7QFZRCNYLy4BNwKBKnTC4xm44ngYjqTE94blceeLUz0Sj3H
	i+tcbhzFERHtH1002fkabqQ9sHghcQQwN7aNUNZ1C4uwbXPjRuRthZHbAw28XTeI6PL
	YRXZuTUlWclP3QxKZl0fSkLHUq6PjGZ+OAEVfkYU=
List-Unsubscribe-Post: List-Unsubscribe=One-Click
In-Reply-To: <20261125075439.GC191152@black.igk.intel.com>
References: <2e4a3414-502c-41ca-9e60-00877dafc403@mail.grokbot.com>
 <010001a20f992959-23c40ecb-a2a8-453d-950f-69dcc3788f56-000000@email.amazonses.com>
 <20261125075439.GC191152@black.igk.intel.com>
 <d69d20a5-d7f1-4de6-8648-02341a07f1be@mail.grokbot.com>
From: myitforce@mail.grokbot.com
To: mika.westerberg@linux.intel.com
Cc: westeri@kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com, 
	linux-usb@vger.kernel.org
Reply-To: myitforce@mail.grokbot.com
Subject: Re: [BUG] thunderbolt: DP tunnel to USB4/TB5 hub torn down
 immediately (adapter unplug) on Alpine Ridge host
Message-ID: <010001a213208067-3ea619d8-0542-439a-8acf-5f91d6269f6a-000000@email.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 14:33:46 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.us-east-1.fEnU3ccvllxLtJBUaYT91MTmOYNbRqP5oL88A2UkuQF6ossBVbh5STHzasceFsir04XyyuG42nT7n6uR29FF1cITEcL1ChwuwmmnByiLq7b19cZXcWlSBKaGH1eTvuCkTV39F9cQxjTxRwjaqAkRRXNrp73fLaTAWNswKCAdEs0=:1.us-east-1.6duzA/nfEyqJmYS7DZLtjVrpjz2pDnbKq2D1dAyqdPM=:AmazonSES
X-SES-Outgoing: 2026.11.25-54.240.9.33

Hi Mika,

Thank you for the prompt reply and the explanation. That makes =
sense given the hub isn't TB3 compatible, so I'll go with a TB3/TB4 dock =
for this machine.

What an amazing community. Thanks again for your time.

Jeremy Menefee
