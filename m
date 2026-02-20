Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7B634844C
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771595007; cv=none; b=quyCoe/w46i6F//dLnbz70DR8tg0ifA3s95M7LvK5ltI4vo41VtYoshkimlLeBzBLn6e0V1DvOFvdu8O4mCWXkG4JoD8dRF3oSWugWbsjJMMVcRs7hcK3Ld36vOK/5zhNuwL0GpWQbArcacbIyuLqegC+2X/ywatlB+/IXdAVZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771595007; c=relaxed/simple;
	bh=8PHKNDDYkpPLT2AcX1kZ8sOQUJ7L+sYJLMMawkbhe3k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i4+hTIMM52tQyb3qSPHNrNfyO1EscKwbkWpk1ebPquqbsIdZ/Gi4N3iWKbxJCtekOAGMF1NEPr24BxKJsk79m/tNWtwsqZe2gpV8LL9Q/QkCHW95D1ZYDEQAnQvKsz7dJ5R6CZ/FI54TYNtOK0yzB2OvO9pTtaA68jqD1a3yEkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bgRastPA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bgRastPA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4AE051A0A09
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 13:43:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F0115FA8F;
	Fri, 20 Feb 2026 13:43:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE11C10368CAB;
	Fri, 20 Feb 2026 14:43:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771595003; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=8PHKNDDYkpPLT2AcX1kZ8sOQUJ7L+sYJLMMawkbhe3k=;
	b=bgRastPAxZ3zRJDC/G92pIGVWfng7ovHiOr0NlFmtw1inUQ3L4Z3Oj2MYVmSvsnpOnzk6Y
	NFsST5k0/zABkvnpjjkojTRh34xF8N0aHHWvVLE9YFsZglKOULCSf/qS/2sHDEm4ZAyHc/
	y0OrDfjqkjHeE877fFnhwjbMTFgJnbg253kwUahTjooZVRRn8RMjU9KbWBkZzlbRD9sS9A
	SFVoMqNyEWxuk5FdKfFkwPUwLjwaCKHyb2GNIz3R0+SjzIH4NaxO741jnsa8q1jt6nh/OP
	vf3WfBOaQFZWVmXiJlQ0B9X7fIxpv46r657vSgk8HhmW/E/TfCcF2mvxt1SKtw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] usb: core: don't power off roothub PHYs if
 phy_set_mode() fails
In-Reply-To: <20260218-usb-phy-poweroff-fix-v1-1-66e6831e860e@gmail.com>
	(Gabor Juhos's message of "Wed, 18 Feb 2026 21:21:07 +0100")
References: <20260218-usb-phy-poweroff-fix-v1-1-66e6831e860e@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 20 Feb 2026 14:43:22 +0100
Message-ID: <87bjhjsf7p.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 18/02/2026 at 21:21:07 +01, Gabor Juhos <j4g8y7@gmail.com> wrote:

> Remove the error path from the usb_phy_roothub_set_mode() function.
> The code is clearly wrong, because phy_set_mode() calls can't be
> balanced with phy_power_off() calls.
>
> Additionally, the usb_phy_roothub_set_mode() function is called only
> from usb_add_hcd() before it powers on the PHYs, so powering off those
> makes no sense anyway.
>
> Presumably, the code is copy-pasted from the phy_power_on() function
> without adjusting the error handling.
>
> Cc: stable@vger.kernel.org # v5.1+
> Fixes: b97a31348379 ("usb: core: comply to PHY framework")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
