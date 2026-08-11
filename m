Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81BC3B14AF
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461512; cv=none; b=nLYZHptowbhaOWRnDghOlbIl8w8RN1YzXCvYzlFxDxk+PZ6eWOPdUA9nZyabBVsVDUqe5bcJWZ1vH+rn/1v0Hp8df0JIB1FZmchzMk9l9A3E4QEfiiae+iEeKwJuFYeejRV9HQyHwAmwV6iS/0G/Sng2B+Of1dvgWubDKR6ohWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461512; c=relaxed/simple;
	bh=t6b/7f9iTfBbSW52gcqq0uJp/VvOEKFhjAk+K4wTM7I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fa5gH0VtYSk/0oWxTfRaeEUXmAzJs2uf1FV1eI43iMcnvCz9NslyqioYTiaZn9NvyGlf9S6c0bG1KwvJZpW2ydPi3JnmGDa7Ap5velQyFZkfLrX05/9WgcwYEVoyv/EhwajPEJubAb0lB8VfG3wllv8h8HilY9NzjmG2RByejLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=objh9hPr; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="objh9hPr"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf49dc28ccso63175ad.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 08:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786461510; x=1787066310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DUjBOZ0Wtoucb9ANezyNYsxpBv3Z34l1EMfo1p5GJ+o=;
        b=objh9hPrVcKSBA1tZ7/CaiW2CPsRXgBXzMt1shu2uwxsajjGXG1aIwKl7+3bHe461F
         SEYD+3ZSplEqVY5s9+ejiIIm8e28hugb1oBeR24QwROTrOF9CaUYvwIWKiG8xZVZy6PM
         NZ3nj0DWWKRFhJwmNeKEXgHXOX/l22r9AStfEqWYQt+Apo6uMoeLO6QXMrfgmlWD0lcd
         tpXzDdR0icPawB/6qxcz6HVqp+R8oHKJCo3tYjVChfd/LhmEtivfUGz5jjn+diFTaRYz
         sDnNcfN6MXQlXrJY/6KhYTXsXG10a88AEOOsZO55t19n8uqTp7MKzUY44A1BkOPspbr1
         VkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786461510; x=1787066310;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUjBOZ0Wtoucb9ANezyNYsxpBv3Z34l1EMfo1p5GJ+o=;
        b=qI7XYgjKot92IXMMrg26ldv0zAFCJqYUwvC2/ZIhtqBuh+cqft5acsiCwP35ftM1yW
         DmT0FollP+k3imsvDg3RkpjqbC8zOo3Q3+74ZBTTZR3WI2PmFbOblZpMUVpBLNq1IGrm
         HrRuAjmL0n/qbWJhF12DWrGzNL7jrESuPVJwFX0hnsl1gRGQ2aXyaswgCOWsjSIQAbGH
         w9d2hcQWrc2TNtnEQNkK33OP35N4+TDIwFBB2k4JHiS+SfZ51FlbnfJpKPd/tsaJZNAd
         AIsqLmZb3ptSsExZ8y1G1+1Y00fGsC65rPZKFG0qw1p92Lc7hc5WbkGEX2ntCPfRZLQH
         27Pw==
X-Forwarded-Encrypted: i=1; AHgh+RpMjMqW00Df66Z7iwrcIUsVNGbYG9iE+dUa74H7LuhmhifG1eSfk+vqF13pRQ9dqMYCeS/PvVtdJ7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkMsBtXHgQV8x9+zvB7Y5XnqKjc9UD/DWj8IXXoixgEtutjYTq
	eS+U3IfwnoXuhTOAWHdyAcgYmlvJ18yq4Q9czZ3LyRNmg1KxAI692oY=
X-Gm-Gg: AR+sD11APxjDwk/MMX0Tzm/5N0ttEVEHIMPCYBkMHfX+1FE5yd7Oy/L0GYn87xljkX8
	Z7bHL34MugLIjtJjM/hPL+YOchHC7QJGw5ILzcQZNMstlxAsGL2oQrjJbQQ/oPV3ylxl9zW3LKb
	XjiFdlDuLy5gUKqyIjM+izO849EqwNCXCDyc9J4u5ahfNgCC+QZCRiKoZwoQQukEKosrP35JO81
	XhqK/MizmDEOaJbXzWEZmDwjgqaYZkOzBrt78YDRtDm6gEMybFT3oapnKpXj84r8fnQOrVKe5Uz
	num+38OVMAJTD1BZwdI0uUaAnhQ1ZQSDn0ErVWABzcy/7yxG+E6Ziusvah1RBbQz1QAB7BU1G+D
	BnXtpQO6wLo1Mdd6f4RV7P+8TS40vVcJ0rr35G1tMLeCoITXbjSHZW/2rj2SPfmUEml4ulAuOKu
	Ej0A8i8njpRbRwmiILgOIy4TYsfeGQIyPI/5Zh
X-Received: by 2002:a17:903:4583:b0:2cb:2b50:d9da with SMTP id d9443c01a7336-2d31791fa70mr38573335ad.3.1786461510169;
        Tue, 11 Aug 2026 08:18:30 -0700 (PDT)
Received: from matra.magic ([2406:7400:56:6dea::2cf])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf628e42asm640438eec.15.2026.08.11.08.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:18:29 -0700 (PDT)
Date: Tue, 11 Aug 2026 20:48:19 +0530
From: Amit <lestoppe@gmail.com>
To: Huang Wei <huangwei@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold
 <johan@kernel.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid
 breaking VDS1022
Message-ID: <20260811204819.11647add@matra.magic>
In-Reply-To: <20260811131729.86563-1-huangwei@kylinos.cn>
References: <20260811011008.0f7435c4@matra.magic>
	<20260811131729.86563-1-huangwei@kylinos.cn>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Huang Wei,
	
	Sure, here you go!:

	Tested-by: leStoppe <lestoppe@gmail.com> [Debian Bookworm Kernel
	6.1.176 ]

regards,
leStoppe

On Tue, 11 Aug 2026 21:17:29 +0800
Huang Wei <huangwei@kylinos.cn> wrote:

> Hi leStoppe,
> 
> Thanks for testing! Could you provide a formal Tested-by tag so I
> can add it to the patch? You can simply reply with:
> 
>   Tested-by: leStoppe <lestoppe@gmail.com>
> 
> Best regards,
> Huang Wei

