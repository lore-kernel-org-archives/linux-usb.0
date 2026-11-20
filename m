Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183402;
	b=q/o+L3yMY8ByXnl7CnhODnXAz1XofCzCS8TjOb1ROrHRWc5W2veZGk69qcCvZ0kYqwNw
	 pAw4jP+yiugAR97mgT+UKkJZTZb1AiPiOiEQ/vivCX2hjV0CVAhpgxmqYuoWg4o9+M2TH
	 RH4N3nGWNxzjpMa6iRCu6sFXacJxVVSWS05Mt7oZb6h+eQIxqDPUEW1xCuCnInGlxfs6w
	 qPorMu6+lu2+6gOcZk3bujjoyoO1O0ArX3bxQpv16An7qH0Ufo2uA72y58avjxzWCAtja
	 ObB7VUFuX8/D/Du04EAxNeUA8g9ydR6qca6k5nHx4bdQLWl4GqIX4JrNvijTUf23HvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183402;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tFG9ELaZuO39ePqAf1cRE4jtzXTTA6BhJPeYnFv7KrI=;
	b=B9KlQBCu2crOWrKPsat7P+fmReLL0AXfYq3/iPoSBr1bBwXsbvvOSoig7cKAqPzZBftF
	 1atmC/USzq65WiSvYTMrVWI6CUl8jfF8c13CObG84sV5AGoxXSUF6GKqygM7H0uHKV4ZC
	 7kS20TExr5ECtqLExoC+AxpaZ+EKU+frIqJduBtGV0t+OMArG4ScVvQdMi9/jYgEdwGzs
	 4jYhxW7RdV/QjGniHN06gFgGwIlo+KdaprDVDAOistY0RrydRVHeslNdwluvOpVQT8QZO
	 dx8NTcBIHb5Jit0nxIXXwO+31V2cvc+CHDa/Eu2SFmjUV+iet7u3H51E2ajWVmgU9rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nczM8Pid;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7C8606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 14:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nczM8Pid
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F311F000C6;
	Fri, 20 Nov 2026 14:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795183401;
	bh=tFG9ELaZuO39ePqAf1cRE4jtzXTTA6BhJPeYnFv7KrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nczM8PidpsfTFlrJXagCF8Ecao1vX/JFXhUTqSGAs1jKIASxvI1tCDEe57/kgP50E
	 R1no788F0PiR2NQ5CuJBZnctVFbinomBJFqJfYV7leZ4YzwF6g0KRhQWNxcQvsAHAy
	 PjWtKXY7m1T3kwtjDjYZl/BuIYUHKjm6q91qTZOg=
Date: Fri, 20 Nov 2026 15:03:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anfernee Cao <anferneemelokc5@gmail.com>
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: musb: fix double put of gadget device on setup
 failure
Message-ID: <2026112011-dingy-onyx-4d4e@gregkh>
References: <179250629747.20696.17364135141613638741@gmail.com>
 <179419596286.2244.11782596409403661076@gmail.com>
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
In-Reply-To: <179419596286.2244.11782596409403661076@gmail.com>

On Mon, Nov 09, 2026 at 11:46:02AM +0800, Anfernee Cao wrote:
> Hi Greg,
> 
> Friendly ping on this one. Sashiko reviewed it and found no issues, but I
> don't see it in usb-linus/usb-next/usb-testing or mainline. Could you take a
> look, or should I resend it?

I have no context here.
