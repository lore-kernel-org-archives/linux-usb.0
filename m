Received: from mail-pz2-f16.google.com (mail-pz2-f16.google.com [74.125.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CCA3594A
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 01:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789955309; cv=none; b=VZLkgTGpjem6jIdG1w7o22QI9dxK0zaHLzhlv16y1JsKjgGKbMdo3CKAdVYND/5V7G+orVaYM8mCl+KJ1OdxUm8tHilerrkya4JIWJrzPuw/cfWy8qdCccLGFa6fVXVcriGirI5sc2AeiZrgRUI3T/kxN9pWDAhxj9CkzEMzSSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789955309; c=relaxed/simple;
	bh=NokCmnDavm6nge3ht4581Wl5cd5odu08TSzfjqYvPX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNy27Gj2993eCZMNsC7byz4QCe1Gk0W9sa/W8/pN2SJSI2NwowwXgHkHpi7r7svu0kVQLjt8cgl2Sw31bl3qpVfZAnpQ80gIi1rhsRozLedJ+yYG6EqpBX6DcGUWrMk3OoH/OBjQvMqX2Nh1BlC8nCkbZ+IPLaBR6csl5L0lCtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lT3ZlwYb; arc=none smtp.client-ip=74.125.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lT3ZlwYb"
Received: by mail-pz2-f16.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so1465438a12.2
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 18:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789955307; x=1790560107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9cRyT3K2PGM0R80JNPC3Ark3l212LTWXq1nqw71ThQ=;
        b=lT3ZlwYbPNQga3Ai3VeFDR5UFHMxyif46XNA3HB7rBBE/XDS+csJ7IjY9hugVC/OJd
         qdX6qfS0VzCsCmnxWutLYDB3en5jERq9jcu8TIia0TfCBcMYeB/1/8yhMDop+RnqBkO5
         w11hNvkJ3cUMvMFuLwiXggZppOsGIZrEW0ukBkbkU3Lo1fkTdrB/9fsgH/uvNKSCPHLw
         0VCINAUzp86WNvooMKfkqvbJ0zIXMBU8wJO12asWCWfJ3t/WaWxTUQxGBCIalR4oKT9H
         XOe+xGd5zTTI5dkynt4/7NUPdrx2J5rj8nY6g0h1J8Bu+SlbduWb034pxUDrwRG873Hb
         5KVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789955307; x=1790560107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d9cRyT3K2PGM0R80JNPC3Ark3l212LTWXq1nqw71ThQ=;
        b=dmBU+wbPcFExDdBxsC+C3ztkOaCquxy/y29DxmgLKKTrVQOjteeCYcgDYvoS4/mK2x
         SktJM+O1lXwQnt+A+f6SxgsJbhPGVRjbwPU+DuJiiUPSTjfbL8FL4F2B3CJOEmirytbp
         6YmZki/1Ok6Ql1gdipJV/hC5KhLWZ6OItgF2+u0rjN7tMrCetNZlHHsyv93sGu+S85HH
         jrleMKNjLCKteWveK/2hyvOPGpbOFAzBZfK17Kealn9ZeBgcPj79iVOYQNC8lCtrnNrJ
         vAHX4P1oYYb6YXGIErqCiCHKeupOdZApdpZahEhYU5Ls6mGwbrAta/NNTApWzAdzTnDB
         7DuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWv4f1SUkT4ZIRosrdiI/9EZBHA4/iRo99BuYNygKs0yWn8R+AnsGwE/7ApAQQD9vCNxrUqbd5aU8=@vger.kernel.org
X-Gm-Message-State: AFuF++n9i30mJIouv8jPKZVyG0h4WwG8qmAMNjkoEm2VG7Stnc06fU+2
	TK0bZm6jXou0o+Lnm3LPGUNjR8VVh8pqekMYviBZJCKAYlcIDTzOly76
X-Gm-Gg: AYBFou0WERYjxB+scqn7LGIDyRj87M6mWUEcgaGdr9TKUxi5B7dDQqOaZFubi0rwQXa
	m/oU7a1wK7x4bw6cP9drz9banE7iGEvH/J5OIOIp8kj5IPuUHHYP04odXWa7NCVsT5HWnjMWd7U
	Uh6GQQvzxaxACVAIfOCkk0YYtJjxFvzfcAh6u1Mkrjf2o+AkyCeZ/HbBzTZcZTY3bJ+e+VyJQGl
	Xl/85zgTdhYFRxQ0kSOXmaCTd7S9fF5ETC2DIgj2YCFI7gwiLETI7v+YjmVA4IrFmhhqRGiat2e
	wHCWk8Dn0nkIwcKwo1z+Uud2ErEUIl+vSjBQg4wxb/WKJZyC784GaEqCv+uP+ErJteMFolGv3Y6
	Y7Wj2p2MdVN7pw7OkmpDonf8n0LWZkxtJd0EoTdsyl0uEehpDJAejf3jNEib14QH3TO9wl1aLSw
	VN/CKRgelypXqteyXEJ4CT3pS0Hop++f/M5rGYms8QKqrFu3fIlOzU8+8BxuFZoAhBrvToR0bKT
	H4oZORMTCCR9QATqVYMDchp+zxCUVf7mtWIYhJ8m0AhTKSvlJJ6t4nBjQ2X/u2cf4YnF0w4QMdz
	K2quDQ3zmuxB7pTaBb0Uyw==
X-Received: by 2002:a17:90a:c105:b0:39e:4c80:f67e with SMTP id 98e67ed59e1d1-39e54f11f69mr15842285a91.29.1789955307433;
        Sun, 20 Sep 2026 18:48:27 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm11345650a91.4.2026.09.20.18.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 18:48:27 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Hui Peng <benquike@gmail.com>,
	valentina.manea.m@gmail.com,
	shuah@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usbip: validate ISO packet descriptors and URB lengths in vhci, vudc, and usbip_common
Date: Mon, 21 Sep 2026 01:48:25 +0000
Message-ID: <20260921014825.733805-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <2026092058-obtain-angles-cb4c@gregkh>
References: <20260919223519.3890269-1-benquike@gmail.com> <2026092058-obtain-angles-cb4c@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 20, 2026 at 6:18 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> > diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
> > index 100f8920624b..8bd9af7ebfc8 100644
> > --- a/drivers/usb/usbip/usbip_common.c
> > +++ b/drivers/usb/usbip/usbip_common.c
> > @@ -482,7 +482,6 @@ static void usbip_pack_ret_submit(struct usbip_header *pdu, struct urb *urb,
> >               if (rpdu->number_of_packets < 0 ||
> >                   rpdu->number_of_packets > urb->number_of_packets)
> >                       rpdu->number_of_packets = 0;
> > -             urb->number_of_packets = rpdu->number_of_packets;
>
> You are removing this, why?
>
> How was this tested?
>
> greg k-h

Apologies for the noise, Greg.

We originally found and tested these ISO packet descriptor issues on
6.18.14, and when rebasing onto mainline we missed that commits
2ab833a16a82 ("usbip: validate number_of_packets in
usbip_pack_ret_submit()") and 4f8d24c48101 ("usb: usbip: validate source
and destination offsets in usbip_pad_iso()") had already fixed them in
upstream, which caused the rebase conflict in usbip_pack_ret_submit().

Please drop this patch.

Best regards,
Hui Peng
