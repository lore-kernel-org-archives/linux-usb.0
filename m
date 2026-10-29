Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266810;
	b=jyyHQWdbCCHJ2PRRh3QVL6j+HfHbvx5fQfLaa3XtUjMI4yv0N7P6+ik5WKgBs9wWhrZh
	 XFLbn6bI7aXBMJcg2FxX81QxDTimhKArDKlwGFnAr1Ftth0F8h1hXSS5pz5n2g0mT3PGk
	 5k3a83yvVcS3+V6YNrJ2uDGZy72h2F6LZ8zwdO068chJn1YISWwDGGZJlrnHzLOCLaYVB
	 9rTGRG0ekIf4EFEkbENX/7RqvLBAoqCdyx+xIVe0njbYsICStoxBwLIIZZSQyaOJ0iXTR
	 WTYynsB8dVmH2NIBEPZiAJCsrpFT8XU1ke3RzM8QYTByl8PAjh0uJ3gdXjHNBRvD3cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266810;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0k/BB4Nplvke+pJMAOyHeqbRDAzgFJgIiH6ohi6XcQk=;
	b=lanLQOVhA9dms9GXQCC6GSlFkB7auowQhkE0++OBdH/xrtQFgJT/PfqyScrgMp+33llC
	 4ERb9vQGjPBh2ZhlWI15h+DYRT3f7DPufL2LqmYFKw+6gmlERtQLRIJBr+1ds3VuNL99M
	 Sp6/uMBI535L0d+964MbsGTzuO08c/tV9szPbA2mDVx4ZMIXZiuuOvIA20lyXr96hCMtX
	 CVZHcR9qVm2OkN2Y2nrxE2iHKknJAI+fAggjXWHxBfDpciXdTuxD2Am+eoL5d7vGo16hW
	 5rutpTjr05QaTaWRgXiJH0OjSOFGBVni5DEJ4CUsqLUauI230JUIB1vPA42vsT/scPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y61kXINd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C5E606A31F
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y61kXINd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C2D1F01825;
	Thu, 29 Oct 2026 09:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793266809;
	bh=0k/BB4Nplvke+pJMAOyHeqbRDAzgFJgIiH6ohi6XcQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y61kXINdcYjUJXQeL3+kQPlvDmpQUSY3g+w1xgnqXqzHKwaYXePNDTdfbE22FjcRV
	 2jP3lL408f0aRK5dAjuvdb8F1ohvrjhnBr8dawsytm9E3b87X7pjW8tqXVMzQEwkAY
	 F49s4zTd4BRTBUKlptgMbNqM3rL9umFSZSzxw83jOEdvK108/c4am25MKBySLsus04
	 XAJFBZ7kJPLclRO+vxomN56XL3DuqY4ApmGTnRx79owtpAsBNVk5LRmAkByMLQlOdl
	 Nf2R8ptaOX4iT99Cm4+LWVGsqDCMzaqKvDNQtR3JrqVk82GSjFcwduoouSuvMfIOT6
	 n7g4y9IFg6hJg==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xMMcB-00000003bZ9-0aaV;
	Thu, 29 Oct 2026 10:40:07 +0100
Date: Thu, 29 Oct 2026 10:40:07 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-usb@vger.kernel.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH] USB: serial: garmin_gps: queue the device reset
Message-ID: <auMUd_DPmH0ojesU@hovoldconsulting.com>
References: <2026102733-prayer-drainer-56f3@gregkh>
 <auMEQr5QphTIqSqj@hovoldconsulting.com>
 <2026102910-jawed-sweat-c4fc@gregkh>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026102910-jawed-sweat-c4fc@gregkh>

On Thu, Oct 29, 2026 at 10:38:31AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Oct 29, 2026 at 09:30:58AM +0100, Johan Hovold wrote:

> > Josef, do you want a send a v2 of this or shall I treat this patch as a
> > bug report and fix it up myself?
> 
> I'm guessing at Josef's current load, so it might just be faster for you
> to fix it up yourself :)

That was my guess as well. I'll do so.

Johan
