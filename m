Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7768B3B0AFA
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147523; cv=none; b=ZgMOJr2FMZoRRXirA25YjxP6omv1kJylGroSib1QRK1cyJZqQuIDIt/pIKbvGa03X13nCsKxW/zXsJM+Ilf69QMLGstmYJbrZUSv35c1Nu76FzsiU18CZ4yHP95wrSbGUTAqOrFbJAgvmUk79L6Mo+lDPAUvE5hmBwZxvuPT5qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147523; c=relaxed/simple;
	bh=JfQhqAVrAGb7QD/nEHGgxs1D9L6nrbUSTxK+DVMj8gg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZaMRXwo5xqu1dff7xj/ojsEi6/9UHT68wQKAhvVcCEal1g5o8c+Vls3rAL4Lfkfq4f1uYnUlyzcpZc3u59nhwbh0MwIqmc5Ytq62DbN3FherWIunCx7ZVH1wlAPlpG9QhRLgYy75OUD1L52+zdJzfjQc5K8yEizomGboWYYYgk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhZzGaAX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhZzGaAX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso18726935e9.2
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 20:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788147511; x=1788752311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/yh0X2KBuU9yYGZNDeELtkOjFUlaqlWTJeOHvjigybg=;
        b=DhZzGaAXDCMaoQ1TiL8dyFDkveH/vyGzu8yg54mwUzIV04kyxk/ivU8/8Hx99lSb/C
         gO+FiTzdi0poO+oqv4hc2qctdhTrN19jp3jGeLFhcFeTuthQvxnbj8dW6LI+Jr/SKRIf
         sGBCp7qCJxpms+FsflXxMDFgRL/sKkPP+2PgsixHLHxdKrBP64jhD05zmngbnhjJWWDe
         smhWAvjfwvxC5dvt9akz4gkTtpqXcvohhUr5a6iDMGhuA6pjz73h/DjY2lLlGcotw625
         PecRy+ryQvydG6LWZ4vRxlpCddMIXhRNH/hdVdUA6zzIojz27YN/VCx5Ep1odh2kHWiB
         Vv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788147511; x=1788752311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yh0X2KBuU9yYGZNDeELtkOjFUlaqlWTJeOHvjigybg=;
        b=GDgf4K1fit/4RApIFtEtTgBheI8oDlNsRINmb9r+dGm6QR8hOVogWPJJFvbn692D88
         tGnxoXOnj0VU0+rN6qxZfSIGn8KMOO6qWQtisNTuJlL5q2FjG4UKjQbMjmshwZBYXd8P
         lNcD9vzDI1B+MmJdVG91dCP9r7PU5DBJhpLn6GTca1r+TbjnqE7os24wvYsDiyyzm8TR
         7/xfhq4dw7hVubIyys8PTyoA5cOwOWWfmnTxl/AoA2CC0akjrrOw1WezJdBddd8FBxV0
         yBzppf+t6jx4xbeKzaO2GjGRJMf8pxKEJtP7jqG8T0QcrabpIdJGc/+jlzFoAdisTUBL
         IjZw==
X-Forwarded-Encrypted: i=1; AHgh+RpMEPzRhr0xlXeerEJRD4N3nrasx9L9fSaXyl2pO0IA4in88nTt2zEHuxheEWNcnIxuM5MGgXaHMKA=@vger.kernel.org
X-Gm-Message-State: AFuF++m6RRH3FYsqheDkR5/GagjZZ0JMZ37XzlgCRTIjnq2q1swWVboE
	HHIXYYSgTwOZMiR2fUDvsPD/5bLMtQqZtjgeEoblSV6k+F2Op7hxvKKu
X-Gm-Gg: AR+sD13X7Y3mJoPOCz6FJn4888qipihDpuH6Fev3b+GXnaF46Htmz43QitJ+7XMsier
	QtvU9nEmFLZNHNAtVu6at6BVk+pJAS/z6LWMSrXJNy/wQAyKjwHwuV6RqlKfpd3wQsbRtFBzVLb
	OMxu0UUKdQdK95V0E981FPilo3dbCpUYNSdtwVI1xQvWaPvTyTDYj3RKlWMY7HfnT0a4W24/hCc
	rmHJMJ2kml0uj1v6SiJgchhYNdmgzmV3MEm839PhTqhH6UgZodP5ZDUVL3XARs8atu9stgTGpUC
	Yc/6SqjzEsjRkzfPdSwnaKI+S8Hd+LFOiqs/ERSSwdhgHG06/4VBjS3li4S+VuUVyT2Y2zXcfSF
	Iw2J4dmra48AtI/87u2mdnCl4iN0PArtDoxCo/KYJa06D2eTpb9fyEapKwTZGxNBzBnz6m0NXwj
	tCRwxducq9WOaVUkRjr79lb2nFKRBdbLbcl4ameIE/uIx9WJWpcTAw5rydkcVWlKqSPXE=
X-Received: by 2002:a05:600c:c178:b0:499:872b:abd4 with SMTP id 5b1f17b1804b1-49b91c21b86mr308435895e9.6.1788147511021;
        Sun, 30 Aug 2026 20:38:31 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab5a2csm17624175f8f.4.2026.08.30.20.38.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 30 Aug 2026 20:38:30 -0700 (PDT)
Date: Mon, 31 Aug 2026 05:38:25 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Matt Eaton <linux@divinehawk.com>
Cc: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: xhci-plat: add xhci-no-soft-retry-quirk
 device property
Message-ID: <20260831053825.11f1007d.michal.pecio@gmail.com>
In-Reply-To: <CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
	<20260829-xhci-no-soft-retry-v2-1-0efe22f1c2f8@divinehawk.com>
	<20260830165934.34e5b82f.michal.pecio@gmail.com>
	<CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 02:58:55 +0200, Matt Eaton wrote:
> I applied these (from 7.3-rc1) to my 6.18 kernel and appears to fix
> the issue:
> 
> commit e3d757dc9257
> commit 042aad8d0db6
> commit 7e0ef4332ed9
> 
> There does not appear to be a need to apply this patchset now. Thanks!

Great. Did you try disconnecting from external hubs? This code can't
detect that, but maybe it's not a problem case. It wasn't on Renesas.

Out of curiosity, was it limited to USB 3 devices or also USB 1/2?
Disconnecting one device or a hub with devices behind it?

Another interesting thing about Renesas was that the command only got
stuck when all root hub ports were disconnected, and it would suddenly
complete if the same or other device was connected back to the same or
any other port before the 5 second timeout expired. This gave us hope
that the problem really is limited to disconnections.

Regards,
Michal
