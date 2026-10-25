Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792944626;
	b=xUEE4iksgqYr40cOHPrdlFH4Xsc51hX8WHaK1K0N25d/riqkAgeb85bRCGAznJxzsNZI
	 xSFx2xQ8m4W1rDzlSSzWcA0jvsX5E9if/hisalFd3GpE7MKrNBAPZuACNtrmY+QTRWte/
	 RoikKpuoEGgGgOvRwvccbF78gEQBmJhT5ky1+PMjh7Fa1raz52Yg4EV7I/NKHB+70wEiY
	 6JXTf5jsd82GuaZO4bUoWve5eXx8CpFwUMYwGpDEc8Ry2S0NK+3umDtomAMUZAw2fjDBz
	 vVsKqSCn+NuHfSQRM8HDlOGXV/ed1zIL/8VSEpVu9ptgJ7PRNKxii5f+ND9S5N6M0KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792944626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kI8AZKbkyFQDh3fWe2Ucjc2rZL7S/+hpSffclpLVllg=;
	b=guIy02ONuvl/jxyQLVzQafZYYHV7g+MKnwsBHq17zkJMnHbBfkn6CcohQuBs6wy0NGA9
	 +oKw9YlH6L/la2C40v/vb8+JfgKZ4Rcyc26x/iORW/fhnLQOB9SuUpXhlX3ii0niDxDlx
	 1cDjyg/ZyjWAWqlrwQm5ZlKEQnB/7gfpoWrdQapYfXS92IBScU/6pmXTgh6rzEIfdJUAC
	 KU3as5h/zVDDIXAdA5uuudNMSC+HlYuqOyQw2nUqPwclkMgfMofBzIp/s3o0O7GGqTdpU
	 qoG10lc+Y7dEH79+ikaB+gQp9zLFjwNCkYN546eg4crIK6YI+G9spJyM94axoWHes3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qYpad43G;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34462606A31B
	for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 16:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34462606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qYpad43G
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2087068f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 09:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792944625; x=1793549425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kI8AZKbkyFQDh3fWe2Ucjc2rZL7S/+hpSffclpLVllg=;
        b=qYpad43Gp/uZiEgOdnGtjj0dO9omo54vhgDQNKJjCMZiSRGg710/7z2DhUVP2weDYT
         HzBE8cndmQ876KcaN2/yw0KAN4B7OkC5BWezW8SwqlxLy2fZ8t2pJnhlHXeEDiOn+5pF
         jT4fyQ/AN6iE5tI5h28AdqTJSDxBmOxkSUnKUK7+ZOWtw8vbNAPzCJt2ulFSqILwVcOD
         iqWZF6lnoyhzTgvqPmqDAr85fnoC4P3c4vymDolWoshsScrSpYiTv3znQtbqtPnat7sL
         SmbQ+2LNm9ij/44/oXz/IP1IlhG3EOxYtSOImLxjwFWrrYhYDw6JzGdr4p5sBVVq9MH/
         NOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792944625; x=1793549425;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kI8AZKbkyFQDh3fWe2Ucjc2rZL7S/+hpSffclpLVllg=;
        b=M7gvO+jq+FXpdQr/VzYSXCT4eV6+oVa08NOiTjA7SEFydV8Wp6xMna1i3BuXTVwe2h
         Gk3FenuNNi2rXtBYSXDpRXJbRTc1VZr2QEH7tLCC1ZrcS2AA9SNTIYJ6DEZ9IFtGB9+X
         zVWR3kS1NCWMvFHHE4WJDtapmDBBQs8r43r+5L5x3bU/3YLJssDQBODL2iJTWiDlCupE
         d9rfyh6bSKp8o8x0l8Z9vRF2Pv9HXQWhLvhsEB8lFnl0AABI++b8WOjriHnX/Q6Zpjhb
         wqDGw/sHh4Ey46MDhYkuEP6esu/0cJewp/TyO90K27Z2R8R9diJrQu3GTsaZs8asNCNf
         0yaA==
X-Forwarded-Encrypted: i=1; AKwUvBx/vwmQ4JifTpP2l6EKTBi1wdWCV9gFCxsQtC/IzubJpoKHo/oeoRhpkmGbEBmEDh7FTneX6J7Iads=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGxx8hdnDZ3VbKsXidO18GJYHmQ0hAkJKdNFE9tJtDRM6Qpovi
	mzzA8jSWNx8Oi/eY6DbR0DN7s4QGAorRxivLnQjWiulsjNaVt4tULmDB
X-Gm-Gg: AYBFou0ion5s6jsjvPPvZIHtHD9KzTqoX5deDa9t+09+z0mZNDtvHOopo1PnwTRgrX0
	45wETxPug1C02yat0sFYmodyKv3TbNInLQRoty8YkzDZ8IH5gPx5+iW1n5vFq5fB7ncnUovp4Ra
	MSHHvA/+x38txtgzKIqvyDPceJ2PpwDGE7w90l4elwRwiMyurWcVw5B5Li8ntYsVtmayzClbYgc
	syo8XgdXBgTgZ7Uk77jcNVUxAGZ5545W3HsPYpOlYoo4zBQd+pUhR7g8sd5+ZZP0Nl85OWnDHaj
	fSmMwR51d3b8G8uZqZyDtkJ+/yHr8gcmEEkO6mX35wicO8A4yRZnZbpsfuI4mb9UHS4ZkjMnMLG
	lQ/xSSMgYNa/BeKFpbCqKY5T8Xmf+144B3WnKacERSuEFdiyba5lckPyqV9muiMvVX99sH0GjoN
	Jy8Qb4Ftw+w4byVa3YpXWGxVVQ8sAvVmHeSRWJG7sFmtIIrX3Is7G0/lYZSxZ9XiZoMmBLj8QPr
	ILTEKDjv6oUYsSUbN3tMebO5IR9d/FIK6yV+4ag9XgPd8l9wV90a8Xg2r4fngaT
X-Received: by 2002:a05:6000:2384:b0:488:7df9:3898 with SMTP id ffacd0b85a97d-48e3eba06efmr8344636f8f.56.1792944624393;
        Sun, 25 Oct 2026 09:10:24 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd37f4sm13019486f8f.44.2026.10.25.09.10.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 25 Oct 2026 09:10:24 -0700 (PDT)
Date: Sun, 25 Oct 2026 17:10:19 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: IgorpetinDev <igorpetindev@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, Oliver Neukum
 <oneukum@suse.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
Message-ID: <20261025171019.49c9a66f.michal.pecio@gmail.com>
In-Reply-To: <76dfb124-d488-45b1-9525-5369026b529f@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
	<20261024155614.2732-1-igorpetindev@gmail.com>
	<20261025000643.425c57ca.michal.pecio@gmail.com>
	<CAG21Q83f_Oj5+-OPjFdxzmLWnFkjfYhY9ordyO0zoGtxkWEW3w@mail.gmail.com>
	<76dfb124-d488-45b1-9525-5369026b529f@rowland.harvard.edu>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 25 Oct 2026 11:16:59 -0400, Alan Stern wrote:
> > > > +      * Even though all URBs have been given back,  
> > >
> > > but does anyone actually believe this here?
> > >
> > > Hundreds of drivers written over three decades, often
> > > without linux-usb review. I don't trust them at all.  
> 
> If it's not true, there's likely to be trouble when the completion 
> handler is called.  We could forcibly remove any remaining URBs from
> the lists before flushing the work item and just leak them (with a
> warning of some sort -- ideally, one that prints out the names of the
> completion handler routines for the leaked URBs, if at all possible).

But you are now talking about developing a whole new feature of
unclear usefulness (will anyone pay attention to those logs?),
while my suggestion is merely a small tweak which costs nothing
and makes no functional difference under normal circumstances,
but reduces severity of hypothetical failures.

Regards,
Michal
