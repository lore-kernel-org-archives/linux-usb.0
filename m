Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606B0453A45
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 07:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532448; cv=none; b=qwduvzO7LpadH8vxlhFjpx/i24qvktqJAwn1HOLRN1M3MAVf+dGDaACnuNUiBSTBa6MdJcWRhCi79y0DxfXDj+CBER7ZiHSE/T/tmUStf0QRtWx5TqesSNzlCcchofI1hZkG+s7qkfel7aVhZZVFu0EaYrY10IY9V4XeO72kF0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532448; c=relaxed/simple;
	bh=rLO0WrYgRo8iK2bBKDJz8r0gSgkH3OvbEU5jGBqBb/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMM/AsLIRpkk07QsqQrVePyB6FYY8c4wUKvQJCdttP2VKX+RCia0jJrneh0I2NPevS8fG8lypGx4R7gPY1AMk8NPOZlgM53DV7HdHvAtJKuqLjbny0qdgMp1jqkC8vNZ42Cq+9qiaLGFgkEmJXm1XatsJEgg+ZykYTffErlxxKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIu67yb9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIu67yb9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376031F000FF;
	Fri,  9 Oct 2026 07:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791532447;
	bh=QD5RBTlwMPaCutDwJ9AOIrGEcnyyblOGc4yXF/rGP5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CIu67yb9k3l3Af80qzX44NpNhShuAsPsQQTxG8JgLyC/2loZ2wYj9QVLQqdw5LUTB
	 32FnbDnPwMDQBKHMv4RiojwJrD4rzC2RKWJgxN5rdjjkq6mtGmrao4Hj4mXHlMSqJM
	 5DM/+J2YUoe82l0X7GYVe2OA8MTo3CyFPidbIYqx9Q/V0YrmFDVCdPwGZlASex0OFm
	 RkfBFgPOjlI2HU5/66xLyiVwB40u8a6lppwvSGhoxpP+IQ/TEZwedf7GOu2EaKKZwl
	 sBXZZyh+O0tAKSRlFb8icz7t0MaaM75Ftcta89QTqkf/8A+08/3EPakvdgvg4ATuxe
	 EvvvZGLDi1tDA==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xF5Qb-00000001qIS-02cV;
	Fri, 09 Oct 2026 09:54:05 +0200
Date: Fri, 9 Oct 2026 09:54:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Michael Wyraz <michael@wyraz.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: option: add support for ASR 1286:4e3c
 modem
Message-ID: <asidnex3SYzo0c29@hovoldconsulting.com>
References: <aFJzdxe_ykNw6cP_@homebase1>
 <20261004094321.2256936-1-michael@wyraz.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004094321.2256936-1-michael@wyraz.de>

On Sun, Oct 04, 2026 at 11:43:21AM +0200, Michael Wyraz wrote:
> The ASR modem used in the Tuoshi LT22M exposes an RNDIS function on
> interfaces 0 and 1, a diagnostic port on interface 2, and AT ports on
> interfaces 3 and 4. Match only the vendor-specific serial interfaces
> so option does not bind to the RNDIS function.
> 
> Link: https://lore.kernel.org/all/d12635f9-9706-4dbd-8adb-d673c6a77202@wyraz.de/
> Signed-off-by: Michael Wyraz <michael@wyraz.de>
> ---

Thanks for the v2. In the future when revising patches, please remember
to include a short change log here under the cut-off (---) line.

Now applied.

Johan
