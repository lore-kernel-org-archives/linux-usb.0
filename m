Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F48337C907
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 19:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782241742; cv=pass; b=oeH9xvBRlYJO1Dw1mddlI3HnOddtciB++NerXpL/iEK3f05M70ptX6bMrickTbZ3jSfB9zgSwXo7EliS7sfMJbtR5uGbmzt1A8de2NItT5FeTwjSSZ2byh15VbSBBcX73eV2SvHLuk7FNbWLKuBgYysbjtzOSPZ2e4JWjdJFeYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782241742; c=relaxed/simple;
	bh=LdofAR8e/Kti/WYvRJh0sJk3FrQJ4xmAUqnttCZI140=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T80krBVM9AwZ8Y77TeoLkiyz84FVG1vQ/y5d712lnd2zKqDFyeETOBpDWVr/GuBmnGhHPrr/oPKcr+wijffxx3ao4dhlklfdBBpa6hNI2k52+kEcGxB4D/QhbDm2wLLd7fKzdTk3WEOUkcRSS1wwVrD8CnUFWcqBXTgs81gBtzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZ4kgKvs; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZ4kgKvs"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c03a466c96aso31970066b.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 12:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782241739; cv=none;
        d=google.com; s=arc-20240605;
        b=LjkQBuS7Bc77tjaJi8H6gFG+pC8gX3GTPkD9tHqjX2ULoa2pReQxcAbqWPvtoRfINU
         bouco9/KSEVrYE2jTM4euhtCEnSF1HdvO7fhMs4F3qahNHUgmYYwETLzjDLisRAUx4KM
         nEV5tSlke9XSYU0y11TrjTX2jdktxg5Tw22prZuoDlyDnAvgvb0N8A24MJk4iB1lAh/r
         HM8IKv6+xPPGczqldydCIQTJspwtnWHZHrW+4cjqg7trCW8JhLSI+SixcoxVK9m6J2pV
         sCoJx+nCTdk0UjSEDOHmykoQytIgOILsIMZpW7mFg0dmD6k82L8+Qj2BtRQxv2zc82H6
         4FJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LdofAR8e/Kti/WYvRJh0sJk3FrQJ4xmAUqnttCZI140=;
        fh=zMvj/eYSA+xfXWDEfXTJ4zV4GcRq4IoeRzY44VMGUu0=;
        b=ZybuIqu+TmjCafxGNDdgtDVtGafQWyc9U9qDhX7L5tgB4/XyBfjboyQr2DShSUJZXX
         vlJNnplNwta9MtJ7ERydqIlSI97iy6sQXh116ywjsNnWr5ERdU7QoLPxM6Ve24Maqpyr
         6oBh0XtbPkoXafDZLMCqZz9VNG7CT8+fO0LKrZasKKA2avIfi7EopMcF6t6dDvuvjnkl
         8Cm9A/RY5s5eLzJtpOMchfaksda4rWF5zuu2rS0t4cUl3yKHMVDOMN4Y/H4fX6ZxgZRq
         MWa8gvB/m0ODc6cILnNI5vo/nsi9vph/3cSz9X7jC5YLrySUvj/tAC256v7HEbMIaKoQ
         Td8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782241739; x=1782846539; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LdofAR8e/Kti/WYvRJh0sJk3FrQJ4xmAUqnttCZI140=;
        b=pZ4kgKvsl8ZfHTMIog2LZaBW7h+HJS3C+m7ai9cn7I9ykrq1XixVJa+svUpkAZe6z0
         6w8Na8Z1HFLbAO7rqFFjKTYugQBoPk3LXkFCNYShEw5QVmcqATfaPzFAjj1vss3wjE6X
         +ENhVhpuv0pcPZUyMoFwGqw2mzujiCWxx/aRYwYqPxi0Nx6xmhOnZPJ6J5uyso92Vq9d
         VTstEXYWkMy9J83N7rxDSDDwsXy1h35SosuiskqCtLAwmdfdaBDVxLoYFaERZ48IxU5L
         0oIdGKVbjD3cBHWuls2UUkpyYuUM/m+FGjU2DWdN9w/DhxDQboLEm8lNwJylxPYLsm5E
         i9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782241739; x=1782846539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdofAR8e/Kti/WYvRJh0sJk3FrQJ4xmAUqnttCZI140=;
        b=UGDntAybX1fRSNN+5U6EFxqL+WKbYqqvwMQn/wRFpZeGesXmEEivbxED0buOHlnTk6
         Ff0hpy9h6TR9Cfu4Q+4UMbioCi8nd75WF7wnp0UDUg2TzQ4AKQD8tZfazfFXB3cmkd+a
         T4+KbfzHKhfBoYgKbUYu2NqHG4GzFZ3TgQE1nRl1AzJ2MbMXRPVBjAudJr3mIOk5GL0+
         +bQ6CYxgyC8i7JlgFfonIXvh6RwTkpsFvYS/CWtA7K/U3FS0U/UcFz3vxbE7glawaCV+
         o8ylVJaAh0yQRetsHtM4AvQ37T6UzJt4JpiU9ct8OpmQpfWRsgTCI3VV01Dtz3QCk4Fv
         RZtA==
X-Gm-Message-State: AOJu0Yx8gOue5l9Db7h2nGNu/nDe104rsfnppfluHEYqqLChSyTvxncm
	deSrVphCojx0fzHC0i+2qMfVxgPySzzF+TmtnKDCk1vCgHciIv4eBQ69+xsS6wjHy6Qglk4SYMt
	/gmzN/P0yaG9k24W2Q2TG+5HqZBFDfDs=
X-Gm-Gg: AfdE7cm5EYhOnzpR5L/2DstNBk3xySh3iZjEmgSeVM/7M0nUNxQsCmU/3RT2hylpDxj
	Zm/jUw5mrUg25Fv33SaGrD7XXAx9co+0MgqyfV6eeYjlycFPLsVMuO3tUVnWEMTKCS09d+urM14
	atpk5mdbVIWooRjzn1Ejh1WXM4WtZIegdc1ovaO69c1tli8NF/8TxefL0bz+y0S4oLx7aGuqiUT
	WSKJjAL7EtT1oWO3Be4fU4dFF/aqGAgfw2WI9scy1F6j9er+FKbNa5wYeK/mXpy+JIHgOHNlKL1
	omqAM9G1CR2WdtrPDOUzjEHdn2H+RQ==
X-Received: by 2002:a17:907:9c07:b0:c04:93d7:3c12 with SMTP id
 a640c23a62f3a-c0c65adebc1mr95587766b.25.1782241739297; Tue, 23 Jun 2026
 12:08:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com> <75822857-473d-4067-a378-aae2cdab4176@infradead.org>
In-Reply-To: <75822857-473d-4067-a378-aae2cdab4176@infradead.org>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Wed, 24 Jun 2026 00:38:45 +0530
X-Gm-Features: AVVi8Cc1hD2hPk4FFMnKSCHccCyNZqCcEpbtGZZJrz-Ggm9d9Z4FkIbejjM89WE
Message-ID: <CAFgddhKDafzUTCsbYXpWPcN66hetu9aJOygpsb_eLwsU30ADrQ@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, stern@rowland.harvard.edu, 
	michal.pecio@gmail.com, stable@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> add ending '.'
>
> For all lines added here, use tabs instead of spaces for indentation.

Done! Waiting for any other changes before submitting v3
