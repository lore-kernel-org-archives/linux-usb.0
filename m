Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596451;
	b=SuJM8UPjx1SNo9uhWtQiwrlI8Wfoa4zvpNexYf1otmkgz9QNySg6ZTSmgf0W9dyBQ4ES
	 a9AaS+4AsK73LEvbeP+FNTwUmkLcaATVEHn11IW1tIZule3fzajf0RmZvvePeUV0BRXs1
	 miUFnf1Avxz/XWMZBuoaeX5Ka92xJQ/GJUdNih/zCLsXFV9XoNP9/ubKX2e/UBX4YQcOG
	 Rwoh/Ha370n/s4ynkMRTEuUIAF/G2iEE8iNpoIzPAho/kX5+vJ3SgPeNoIWG2YsVXVjyc
	 K9XFfESQ5qoRImVc59ezI5wOi3ZWothWN8WTM7BeMDLbwjKDL7DoGlFkS31nw5sqRsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596451;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KdpLXwNR3YiTKAqJX1q++2ufQ+gyLZVFEyMm7BY4GM8=;
	b=ffIGTiCGv3fAHt7MCZnNVcY/7DVJ5k5U0wmoUmqM0gLc6GkaNoh7OsViRr0uBVhJ4YmW
	 HbqVrci7UY7QQGv8HDMDoQQfbOODLykjBXUtwJxgGS/mwF/WLrnPqEIxUCkSPT0t/PwXA
	 EoAQZvRVzOPLR23zsKWM9Kg0c99v9NXRvDbiRu2WIW4DIfGgWel6QH0n1xjNLVkOb1SjD
	 rzsjsO3EB3miURRu85du5O+bjMXLb4RXvGQZvwRJhvtBm9S6t3UwFJ/nzBFOcI9od/K4n
	 X+Y5I2+MpECT0BQ0RpL4IeS0VGNMjOuXjozfFo6Tnz3sVrbqh8jAeOXSgWLDeGWX9MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hiPDPN+/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14AF606A332;
	Wed, 21 Oct 2026 15:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hiPDPN+/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49AF1F000C2;
	Wed, 21 Oct 2026 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792596450;
	bh=KdpLXwNR3YiTKAqJX1q++2ufQ+gyLZVFEyMm7BY4GM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hiPDPN+/+/pZ2K/hQLWMHHWPv9icCfEL15LhTHGQ4tdOI4FXAbi+VDb8y9C9d/16n
	 gOi0u1NO3KdDEEgmByM83Ecz96kxCjcdWZX0feFRjcxR1oKeQlKq/Ty8Tp0vftXelJ
	 HbwuG3XFuQgPow+y6nnwOQ2TtAGAlFTFI0wU5v4l7FNZ8PIBTwwxjNDQZab5wBL96x
	 cXHfYoB1ko8xRSV+7MBkLIafK6wk2IacL2Q9yiL/KYZf8XvCG977hcCUbB9pz9RdeS
	 /Ndmw6k+NwVC2mUAoxbDeRaK8EX2MgfX2nkCeIi4DrC0HMpepiGKziRfyMKXfztypz
	 RqiilxIAA+k0A==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xJYDw-00000009lwc-2dFd;
	Wed, 21 Oct 2026 17:27:28 +0200
Date: Wed, 21 Oct 2026 17:27:28 +0200
From: Johan Hovold <johan@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 05/11] USB: serial: io_edgeport: serialise MCR accesses
Message-ID: <atjZ4Pcf9_NpUUzF@hovoldconsulting.com>
References: <20261021141154.2324793-1-johan@kernel.org>
 <20261021141154.2324793-6-johan@kernel.org>
 <sashiko-outbox-180370@kernel.org>
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
In-Reply-To: <sashiko-outbox-180370@kernel.org>

On Wed, Oct 21, 2026 at 02:26:55PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] usb: serial: io_edgeport: change_port_settings() locks mutex in atomic context

> A subsequent commit in this series moves the initial termios update from
> process_rcvd_status() to edge_open(), but having this patch ordered
> before that change leaves an intermediate bisection window where opening
> a port triggers a sleeping-in-atomic bug, and could also cause a
> regression when this commit is backported to stable trees without the
> follow-up refactoring.

Indeed, and that was why this one was ordered after the termios change
until today when I picked up this series that got put on the backburner
months ago...

Will fix in v2.

Johan
