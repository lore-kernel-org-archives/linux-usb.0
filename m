Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216238;
	b=sZ8Ccm9040Ai2LJxNlA0Dk/b0gigahlRyse75nfRP6J5ET4C4NBdG39qsg7CpaxIB0UG
	 Q7D/AP7nuNoO3L8pT1o60dOJXeW/EQVVyG/uY7+H2YtxAuocJzWTKX6VagO+6yLxAXk7W
	 QbNI9zznT9f6EvcA9iwhyF1/pT+zQjdI1bxK2W8tI/zj5pcEqyiluGpKmhvuLZNQr1gs7
	 q3PVpXIgRW6GqSTGhReTOCwMZHwCdcqeSUYMqQSU7TzzsDSQ0Un8ahJvRzH5YVOSbc4Uz
	 CWh7Nc0hb3N2Q0Ar6y5NMWY+H9d00U1gdEfWuWVY48/w4NpSTxFiG3q9WSi9t8pWcgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=H7IgPj/cGkUGfI22HQa4cXM5+YTMvEzdbQOzvIOqNzM=;
	b=E8+FukRijAqnmRhLaFZrjdvAhY+P7fPH74iiD65ZG0YXLUWnDA0BJoAJnFT772tQSoth
	 4+kqsMDUSo94BFm9pEO5Q7B1LfD4hImMhN4dHXfxgaAjROLot83YuOwVEUK3mDP7BCoIF
	 If8ejT54QAnExsUm0bKVCZeMgLR6GfxnYNS51kGLE/JBOGkY54f/tTRFJSvz9a2Q2im7L
	 twF8qby9FdEiWKVbwlLMqL6t5ARCuS4C/6wchpHnj1v5CxBLQCvojtmeSXYLw6sXWh1Af
	 tnVh1QFRApd7DbU3cA6GH0/XmPu8qu/QokZ5z6JxK3AB8Jdc3Ah8jmGGqTniaCAhCCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=VL7HSqlQ;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63420606A686
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 23:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63420606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=VL7HSqlQ
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-53ec9237600so686894b6e.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 15:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795216236; x=1795821036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7IgPj/cGkUGfI22HQa4cXM5+YTMvEzdbQOzvIOqNzM=;
        b=VL7HSqlQMHG7OiXxOaPDemnt8QHXpLfmPyRnEgPeBCXL3Q0dJk3S6iJ+MKGG326ZSl
         fKtFsA/X3fJXQoA7O7e6nFpjzg5nWlIT6+dzXuxysJFifySuUzrLtHNirR4oR3RJdu7M
         BHc0r3gIMJVUKE9xX4ke3uSHmbdTyANQLJvgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216236; x=1795821036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7IgPj/cGkUGfI22HQa4cXM5+YTMvEzdbQOzvIOqNzM=;
        b=GOy6tINwse1q+6SSjCbT+EqSL+/iNL1Xs0vQ7jVxldJBUUDxGHJRFDfBuL+oe7ZkQ+
         Rv/SxBHQMPTm/u+WULauY3+NbUE2HjDDWJcwB68fJlH44C32sO14h4Vo48OPskcuaRjt
         d010phdt7gKM+MRF8mhvjeftRtKFyhQiIvd8fuwk0wHIuPdStNjjSebYW5xJxTDXDG3a
         vCqVbNcVTJAro+0KIekpa9waepfHv3glzWI9faNCWVc+v+3ek6DyWsRo+Qwowplc/96R
         1HVE9r/zEWy0oZ7hS+E05zHR3PA80CL5OUcxeKpCgLnJmWiFpyPJiBx0USPh3aJV/J9g
         eseg==
X-Forwarded-Encrypted: i=1; AL+hErFWF/+H/as+sh183G0TY5efKtYBSaUTiYQySNxTolZrHKqbBEGIFqYbzYwyT11B8lufE+OLgciLjPQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a0QN8YiGohip/VjWlfkmWEPUcPU1/k32hYiFIhT3MwGfuhefp
	sBmg3akvz5YYVLzw1BXN2pupkp7L+XCYJO/TBt/72hnMz9xZqeFFPM9QOQrBS44K1hs=
X-Gm-Gg: AYBFou0ZRTmLBYaPZSOpEvkNxOMUkqbJmUR2wmorTiDi2W54Uel0xeasCC72QLfuD+Z
	tQRyuoW90danIy/fLLQ9O7bxPJhLlHuaYNhuztDZY2SHbsurbZ9ns17jsG0fMRPOYV+Xgri7AeS
	yDgAFel3KECExUqaK48vyqQZ+so4qGQnJ0r7QO39XFx3Iy0WKtpVUm3BFfBgzFhf9o72SFLNS/d
	a8XncuEXkbgEJMh7Cs1pKALLiGVLBv9BL6zed3r/3ELECTuAr63pjrZpyly9yDtvoCNGOrLExlf
	unof7iK5ffDNo30xTOYPiuZBsr1uL2AhjzSlZkobYMzrk47RkcruHslESKQ2Q/7OaLR4Fop1gzS
	2+LgAV9pZNF8jtRnM3tfRzlSk7GPXcsQdajYYlpg36mhIu/taULTHkwpH05moXj4VLh7rWusjZQ
	HXjtGJyhxqeYTiWDjh2PP1kCvbm1i8JE7q1mpTrkSxjYX/IUuP2Jq4SXD1G8QdVgTGiiz0AKSe/
	qrxvm0Jxr+kUX/PKBUMVMRUZPqdlrKxzhjmscfJ2bYg8WA9l8QCicOJuu04T7HShEy9hosSxFnE
	KP/00xVHFWgUP3MwcQRl1RY/k54AqX1j5lK7mw==
X-Received: by 2002:a05:6808:19a0:b0:4d7:17d5:6c9b with SMTP id 5614622812f47-57a06d19fcamr4954554b6e.9.1795216236254;
        Fri, 20 Nov 2026 15:10:36 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34250fa1sm3068142b6e.5.2026.11.20.15.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:10:35 -0800 (PST)
Message-ID: <8c9cdfcd-4520-48c1-ad58-c8b90518ed35@linuxfoundation.org>
Date: Fri, 20 Nov 2026 16:10:32 -0700
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] usbip: make remote list honor parsable output
To: Jason Colapietro <jason@suedeai.ai>
Cc: shuah@kernel.org, valentina.manea.m@gmail.com, greg@kroah.com,
 i@zenithal.me, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <CA+Z0x2JTGOsnu7gNPWBfxCZD0vesbezJ7-yhT1sOOuUdmdcQRQ@mail.gmail.com>
 <CA+Z0x2+wLqeT84WGYsWQ1bPu1mz_A72_Ka3vv9u6RHdtQvc_Xg@mail.gmail.com>
 <96eedd54-7d2d-49a8-97a4-44342460c9fc@linuxfoundation.org>
 <CA+Z0x2KoEghFkYKmXckq3ezLo5bvgHJ7yG=JqjHu6Ga3t1wuew@mail.gmail.com>
 <1557ed70-d2da-424c-8ba6-10c898bbb81c@linuxfoundation.org>
 <05047d41-499a-4e96-ac64-bebdc0b330c9@linuxfoundation.org>
 <CA+Z0x2J9iCWO8aaGaLBOf-pK6vaCpatQH-GORPRaJMn6NgZJeA@mail.gmail.com>
 <CA+Z0x2J7S+0d=ceG3tnpkcB5nfEtNNzUcNkhVvJmzy=yHPb06w@mail.gmail.com>
 <CA+Z0x2L9ho_Yq-BCSy2hBhQP6Yp9pmMaC741_YSk==0vS_gmeA@mail.gmail.com>
 <dda50295-e49d-4424-bd80-32da6d562966@linuxfoundation.org>
 <CA+Z0x2Lg3d-BTQqeWiUjz6GN17QAsHsqhTWZcfA2szT2Jvrz7g@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CA+Z0x2Lg3d-BTQqeWiUjz6GN17QAsHsqhTWZcfA2szT2Jvrz7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 13:52, Jason Colapietro wrote:
> Hey Shuah,
> 
> The issue is pretty simple. |usbip list -p -r <host>| shows the device and exits with 0, but it ignores |-p|. So if a script is looking for |busid=| to figure out what to attach, it comes back empty even though the device is there. You can still attach it by hand.
> 
> With the patch I got |busid=2-1#usbid=46f4:0001#| from that same command.

Thank you.

Please don't top post - it is lot harder to follow the thread.

$ /opt/usbip-before/usbip list -p -r 192.0.2.1
Exportable USB devices
======================
  - 192.0.2.1
         2-1: QEMU : QEMU USB mass storage (46f4:0001)
            : /sys/devices/pci0000:00/0000:00:03.0/usb2/2-1
            : (Defined at Interface level) (00/00/00)
exit=0

After, on the same client against the same host:
$ /opt/usbip-after/usbip list -p -r 192.0.2.1
busid=2-1#usbid=46f4:0001#
exit=0

This change removes lot of details about the device. How is
this helpful other than for a script that could be written
to get these two pieces of information: 2-1 46f4:0001
from the output.

I don't think this patch helps, it makes the display harder
to understand. I won't be taking this patch.

thanks,
-- Shuah
