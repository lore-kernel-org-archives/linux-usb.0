Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.198.212.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776944;
	b=FhcPn8gbt3hH5AW9Y9l+usPTX/KmC9QcVpkiPqdTjbT+B7c2MxfEHEO7vqvVBvVPM5l7
	 DvfOdDbE/NAZZ7Qr+hIPYXZ7MATJldPH58ciJQzh5xKSZPoeLaLWj6eOvft+WESRmwezW
	 qOSoNboxFv2+nH3TTrkQhAdH827evyKhXLLxvNJWCsbLrUbOA/nIesvpEzSPIfBHFX8rS
	 5sRZv3p/8dcUs4mVkNY59ubB+gUmq9YLO8bz2e5SnMfdi+G7+x06GpD+pQgOqZ/UJxq/w
	 Yhhy3/P9KgGEP45EOp/+LQMWyleVLPaD7sgMj0XBHkQR7Xl3mGfjd47L1ABArlwsxxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776944;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:Sender:X-SA-Exim-Connect-IP;
	bh=qojGoJDTrnZSRjz/6Zcx/UCSC0JQIcis9hhYYMvddQw=;
	b=yjVoCPOfeMNmYetcnAaIRkZ4tID4IWju8QdaNPHiwkAd+sw7FJnYMGbtSz7xadiEM7pU
	 dTW4MQSwOLOf5T2XKun10mx/IQ38RbYgsMxLJaKJuYbosY2DCL0VtFzxWv0NiR+HHNRpI
	 a4tNBqkSfK3nAAOTf0+zybo+LUXq6YtbJyr8RDqx6nyNSGVr6MhtdI07lyIMMQC68m77M
	 OhhfinYmWnZO4iRYRB+Yzj83EDI6buHlRgMnVeTONPYX5gzvGwdU5kTrw+oMb5hfyZqn1
	 euVmyC5xm63+VviCKorIDjluVank6jwG1YSaCTwgfZU0X2KhWMt5ZRqT0sN6dD7merQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.hr;
	spf=pass smtp.mailfrom=griffin.linux.hr;
	dkim=pass header.d=griffin.linux.hr header.i=@griffin.linux.hr header.a=rsa-sha256 header.s=20261029 header.b=nkN9mMT1;
	arc=none smtp.remote-ip=193.198.212.57
Received: from griffin.linux.hr (griffin.linux.hr [193.198.212.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF32606A33E;
	Wed,  4 Nov 2026 07:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF32606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=griffin.linux.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=griffin.linux.hr header.i=@griffin.linux.hr header.a=rsa-sha256 header.s=20261029 header.b=nkN9mMT1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=griffin.linux.hr; s=20261029; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qojGoJDTrnZSRjz/6Zcx/UCSC0JQIcis9hhYYMvddQw=; b=nkN9mMT1/hb3sisYrdsSJT0aC9
	IEk/a49AkP+QK2+YNAjinmcMYWjUOwht+i62p/qOAHCCgXsShO6cHCflYNOorYbGE9C+fksuT2jRB
	oRi8B1FhW2x1vso2IoCp9orgV/OgbVxXIpHhJlSYJWEnnb1kZUk9ACeTJvfqrOWRmiX86y6BlmvRu
	9xd9kBbYaBo3/qkdOLaCDGwwS0+/PyLKbnC8X/OWnUt0ofBFG+Hte/Y9/AGrG3vyf8LU99EHmtLy+
	zna3NLm1rNCXXMnc9x5t+woRFSdbQc19W6Ns9oKkWVjrg0ttEhhdfnPhakXhlAN6gO3OSpl23NYvP
	IKnJnFWQ==;
Received: from vkosturj by griffin.linux.hr with local (Exim 4.96)
	(envelope-from <vkosturj@griffin.linux.hr>)
	id 1xOVK8-00034d-1M;
	Wed, 04 Nov 2026 08:22:20 +0100
Date: Wed, 4 Nov 2026 08:22:20 +0100
From: Vlatko Kosturjak <kost@linux.hr>
To: sashiko-reviews@lists.linux.dev
Cc: Vlatko Kosturjak <kost@linux.hr>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usbip: vhci: do not give back URBs with an unchecked
 actual_length
Message-ID: <aurdLBmNnDfGjJVz@griffin.linux.hr>
References: <aurLXADfuLjs-dm-@griffin.linux.hr>
 <sashiko-outbox-196735@kernel.org>
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
In-Reply-To: <sashiko-outbox-196735@kernel.org>
Sender: Vlatko Kosturjak <vkosturj@griffin.linux.hr>
X-SA-Exim-Connect-IP: <locally generated>

On Wed, Nov 04, 2026 at 06:16:14AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] usbip: vhci: negative wire actual_length bypasses usbip_recv_xbuff() check

The review is right: a negative actual_length (usbip_recv_xbuff() skips
it and the URB is given back with status 0) and OUT URBs (never checked)
are not covered by v1. I reproduced both on 7.4-rc1; with a URB that
usbfs splits into scatterlist chunks, a negative length over-reads the
last chunk by up to 16 KiB.

Please don't apply v1. v2 checks actual_length against
transfer_buffer_length right after unpacking the header, for IN and OUT;
I'll send it after giving v1 a day for other comments.

--
Vlatko Kosturjak - KoSt
