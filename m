Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CDB381AE7
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 02:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787020379; cv=pass; b=Jwei5POPCcbWHDy4Mm4oVY6+bkqYpnjjaCISnPqwT8qxYQ/hlx05GtcvGMItPP99MEO97dQu6VknSbkpe6wttsO5EJL/Xas/sR0Xg25gbWO5FioB6u7X0cGCo8nc9/8QyIgkm3tsUOfr/8S3ljpbAWmLbG0Nis8R5UvgxL9lgmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787020379; c=relaxed/simple;
	bh=Y0drIYP2Of8LEb57lqalduVbGamyKsrLvMLRLzGgmRA=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtzhYwa0+/3tPVxODA4YeX+eaR0I9ay7VQwcaGwBYdOCWwkY6bLiYFH5gKibuRqGwQR16PHYKcKfv1znsn5sSROgTEQlBW5IzgN58fU8Hyfk6se/WR2kw50crwNVcBJ1wIP+bhYwNMZrR359/28uBIAA5ccoaLWYpsGXRR7fD/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LN9d+02Z; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LN9d+02Z"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66c8e41f703so2688887d50.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 19:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787020377; cv=none;
        d=google.com; s=arc-20260327;
        b=kd1d2IhdKXNTo1tEDXAcOvQmRwEcWuSss2qmzfwBqif7oNZYrTWwEKhO8XjySNJVSu
         0UDUNBo7i44NKLtF0ejZeKtKN+ZlCTC23boO2VAnfFwZr8+VU3iQtlqbnPDl71o3OSW3
         GgQeRxku3uxN5ZH/fgPUgHmVjQmOjwHwQAwoZQPp6SyyMPoHMsN5cNO9h+ArvBoHZHuv
         yZ5vh71yuAzfNe8MRpIZfUeKC0Zc2WCabxme9Sdz/RyNAK62YKWp/jr4FmmjZ4UoXxsM
         STTEOwZFTa8n8wnTb3gPNpPm3t5wj4DsL50JIWFA+R+i0oDkNeB1NmS5OtSa9C5idyA8
         N+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=Y0drIYP2Of8LEb57lqalduVbGamyKsrLvMLRLzGgmRA=;
        fh=hm2x09laC0HPa4BaSngROegjC8QhzoxOXQFiNbyedfI=;
        b=ep9q/3YadZi/RXToyA2dFgY4t6NzuZE4wOLtX8saCsxhTVpQroREeMdvanPiSUlX8j
         ZSaL+ERL/msLY9iamOQ9/lk3FmgvAI8XItjYmc3MwIug3J0QWkQ2khFJwmS9hk3DY5lN
         8cAxXLj0ZmoShm3J9Kq8IYh68HFInwZ8Jni0RE6LoKPmc11YQUu95nOSdvQ7MWp5pVhv
         eocSXFaGvJAUSEEMauRXhaCbO4GlGnLW+zARrq+geoAoKWCqOUscYgpEb64efBN6ogWM
         MOPmZPymQwE4sJ3oebXvKMFVTnMaEo3cqPcqEpxKrvX4G/NCskVCVwsGbsQ6sOXMV+VM
         zEGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787020377; x=1787625177; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y0drIYP2Of8LEb57lqalduVbGamyKsrLvMLRLzGgmRA=;
        b=LN9d+02ZptPWgpd4uGRNbEcuGTQCZTQZCiTvYx/mb785OTAAX6OWCCB1SKGPw7Y8dJ
         76AWia7SPt+4YUp8riZO2UNHqCNWm0T0OStHj2qo+lMm5zwglh5cs7Uk2rJ4zsEWptVE
         HcoMeoyYbGvALNg9oHL59DGD3l0EfIhZrZrL6v2nLtqMnD/VcnXQvWV1lKz0TqaZh1dJ
         r04qYm53hCD9qtlz6/0PVztwWpmH9VTnlK9c5Jtspt9qFjbMrOneirNHx84E+qqKY4wp
         YbhgPqlPKcal4QeyAu+LX8YrjY/UJ9c0JMt7jCezmbHTBpybYw08jsTbKbZztmP6lofh
         ABog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787020377; x=1787625177;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y0drIYP2Of8LEb57lqalduVbGamyKsrLvMLRLzGgmRA=;
        b=pOkmmlAsICNNrscJpWaD2/WaR1BH2k5eEsZMomxUh72jJMC+ssY0mpAD7pcMbvbOcN
         JyiIBTIqZV7F/7iyMOBsX0GSnZKSlH2bRrQiMq5GU9wokYgZd0NwYlUaCwVzF48omfHS
         RS+DW99V3nozv5Zn9BkgdLitKi6PnT8ZEvh5tmCLmR2Bv6xwrYTpl0/XCzgPdcljVjzq
         cgVIEeTe+agOAMQeYIHWQS6ZdpMgXkEnLbP+2vV5DpFU0kNIf0etBz9h0OWRaPnjflef
         Pz76V3NhgvwvK7uMkdmA4v2UvF/2+yZBooB69epF21Bb/SM+zA5MFD9d7JR6n1C+BlMd
         nDOg==
X-Forwarded-Encrypted: i=1; AHgh+Ro3IoPscf/cMQ6Wce2g4GM99AF0qp0Czi8odyg5S4cOj1Lk6HnA353R5agu3/hKvs9wwzsV/G2XYaw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx6jxgEq7S3iLrZIfoDKDcg+DPhGm9QB5601IxuMuRXwPiIehe
	brZQ6xU5F1Sa8fnkybR17/rWkE8/1rHywYjW0njIy0YwQOYtgkKzgEV7a+mRHqKEFaac91z7MAm
	2LHVJAhGBCJac2RjKR2NGm/amtA7eZN8=
X-Gm-Gg: AR+sD11A19C8wd6k/2vCViDWJKex7H+9AtIjI7SE+pOx0SFElAVNVt4UYz37XeC+Uxq
	Dnkedo71Ry3Xxp9W+7a//E4WTWVYXi061JIDyTH7EtW/2n/CEgqmwosnjYPAHtS8Hx0DZ0Mm+FH
	oxTl6BUzvwcC88KaCAgSJDt60tFvCU9yQ0YuKSYTeaQhkiLIRtgVTJYukioFV6GHV9UEkCxCYOK
	oKmdAk4AUFJJWz+Pf8iJaU4rm+F6iayVKfHAUCRof3ttzP7OvrivgmDx7/XmR2zseBPCLmI+BQu
	HTwns4RDo4TOex6lwwJBQPamX6tKnkshhBM1mf0H/cWifQIDRf5114OL5EVsX1MZ9ubIOOvIFiH
	AeTrF4JV6RdTcWip5v23SnBPYICAn2Gkog4x+i5HOFUlzZpJigv27ch4o+ZTczKtTq1AMKFZ8fW
	KMyXbZml84
X-Received: by 2002:a05:690e:2648:b0:668:e1:6292 with SMTP id
 956f58d0204a3-66cb9e2256emr1480698d50.28.1787020376784; Mon, 17 Aug 2026
 19:32:56 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 22:32:55 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 17 Aug 2026 22:32:55 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2026081638-gush-preschool-590c@gregkh>
References: <CA+Z0x2+Ww=d=4KJYBD_0Zg1xZgCqoZh=_7H4Vk8e-wusiMQnsQ@mail.gmail.com>
 <2026081638-gush-preschool-590c@gregkh>
From: Jason Colapietro <jasoncola1@gmail.com>
Date: Mon, 17 Aug 2026 22:32:55 -0400
X-Gm-Features: AcwNN1W48V1tyESuvmL_1qHc3WUgJATP_N9ueCSNMeb3j7qB9Kytoao3JP0UAQo
Message-ID: <CA+Z0x2J1rx=D6GPyssGN0tX-+HsAv_xw=ATa-eVNmzsC_FY2kg@mail.gmail.com>
Subject: Re: [PATCH v5] usbip: make remote list honor parsable output
To: gregkh@linuxfoundation.org
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, skhan@linuxfoundation.org, 
	i@zenithal.me, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sorry about that. I'll resend the patch using git send-email so it is
sent as plain text and the formatting is preserved.

Jason
