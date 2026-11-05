Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894537;
	b=RshSsA370mnd3DDWhbs3rOzEwx3UrLYlN1bZYNgpaagzrg+V/Yh27J3fiqyr6qF3yse2
	 tb7y4Pi3SpgBr3jc/D5aqQ6T/IejZ2487hwTelh3uY/sCkc93aQ+vhgoqYQpJrFhotDYr
	 NrWdE19bMcinhAlF8IIhXpDNR5dPWhfK/OwrtWxSTpreNH+XCUM1l1Yd1vjhhuBFwLwri
	 cevTU0vf6oTjpiOR0eDZX+zmvG/lBUk9ojcrE3xJ62zPBjVtowoe/i+pMjoqOgbRcsTUX
	 Aqiph5zrThXiklpN/ilfJ3HwOGsGejBHSKZ60PvGwHzCdL0OnnoBCi0XYTT9HrNbI5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=xLyH5BxRPo4+CcX6SFGnkImfWpGeeFWmsPSuRgZLuVU=;
	b=RmcQnu1KHUqxC4hdR16aip4utvgZ9ntrAoluSTU4lA4gURXh6/H87ng6jPDeUSBeh+D7
	 /9Dr2MWsbC7JFtVTR5fjO+I43KQ+teW2zpCEfj8y3avm98+Dwud97REphqophiik6Y1CW
	 5k3z8tn89pnuhoc5QOsRDgC4vmDMmidAO1YhfcJtOtwHHFUaFAc/ALwQTRa5k78fnqSKx
	 jzvUE39XJDEBEiV8R8NVjt1R33Q8+2ekGTgkAZmEfYtHhg6XlYuq4uQxsYsqpI1dgbp/H
	 GhqbHQ6+qjUk0Ms8VMoLYv4JmhA10okibIxNKPXvy4AA2aACOMh2X8/fJ95s7uuwnpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=k4W5RUTF;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5729606F942
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 16:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5729606F942
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=k4W5RUTF
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6798eb0d190so1723314d50.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 08:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793894536; x=1794499336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xLyH5BxRPo4+CcX6SFGnkImfWpGeeFWmsPSuRgZLuVU=;
        b=k4W5RUTFxfhJNt5Q1mp3+2z0sEkLjQ1h7KS6lJ/sYdDLsUPyoF2mY9iDhwLcpACS7L
         YO5RCRylGBDjBZIFWT4CBgoZot08gQF6okSsaUc5WwjC4J7Qfhdssern6K181fcCvwUE
         dx8WmLY/KTIsRAO61/Wd3eI6ckw68aKsA77oTr1V6nF5g5hS1ej1Q0YeVxoKFQwngVW6
         OKRDTnS7kgb200G2cBHzSwTDC4dHnV2wP962nPZGDWUe3qM5gNm5XKcQV7zEQ1ffBmj5
         lg6DttHeurAxVayAGHXoQ24SUaSK3ABQDFsdvxq6BP4ujpgtXSoGL3OEfK8Lqt7+MWV+
         Ieag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894536; x=1794499336;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLyH5BxRPo4+CcX6SFGnkImfWpGeeFWmsPSuRgZLuVU=;
        b=GraTvrTYiZEa+7MqjLdAfWbNc503Ptkn/i060gbCjtUBfmZambdVLDFLmUSa/G8AKR
         iIrDCqgZGFyW9eNUJABbwywbtzhj9MXw3RF0IYfTyg8SXEzwjdxDw6kTnqXtTrJGe5M0
         Eua46MQ8rOveSi/n4tUmgdn7AzeepG3oFrPYX+5HZogQS2OwogTRWRKkbGO9A0hFWUWF
         T0lcFS23YQBRyvlHMInf6ku9erqvnqDljsLoYByyebwj8jD4HOwYfYVv5rP3zAzVMr5m
         2Pl56PrB8If2gnxJ4L0h9D2TFkVSm7VIg9KM3YSZBkbhE4+Lat7luMb9l7AWm159V0uj
         UexA==
X-Gm-Message-State: APuU4Z+m4MfoqagJfB7XUm+Agf9ry1RGlVJh43Ovbs5kBK2icfslbfRe
	N/KXRGPZn+dfD98J4/uWUQ0tJ5CW9eUDtDUhZehE69mtNBUbDMzdjUl7WOwP6toqYA==
X-Gm-Gg: AYBFou3AZ7ymL5agIj9Yb8OXdgrMcjAN9Civ6hf+JT2wGyYUvUHGE7MvJJM7wF8IrWF
	C6K2h1WVBzXMGIRvajctGE2aE8dHZcW/+lHbyfgsI9Sgy/d3lLErNdzwMnpeWqC23jomNmf4VuC
	xyeCzKvJqDMDi33HdTGS1feHP1lP05eBudnKEMRYCw9+ttG8x4tP4Heb1/B6UOg8DYc0HCrK34o
	0rD/OV7ufI4TPb1i0NgUFNoCPDHMds4+QMNO5gqDNtcL9O8yj5IMiQSCquosMKkBz3KhP3lGJF4
	/cUjdheQ5sKFOC7B6Q587JOQnr+5C2uZHqfIDIiCjykeIQZkZvz5cTm/+LxF5pCK293LciEik4P
	zkRGkE82NtM/ZBb4cwjLi0IOYQbzZ80ySdM79qnxQp4ncqSm28Yzdvm3xC+LIFUPBOoNHnyHlxK
	xDipRVQ/XHSeiCJeHHlS5wdzS8+nHE5AeYpxxz2HOHSv+Azxj83Y03g+qU9c8RRK4XiuJlf3QbZ
	kttKZrwavbY7FZSLyz1Lk7mcP5ZCzbs8Tx9UWHT/FaZuL6ZkT7dkntUbc7DunOMrwHnssFd0sWA
	FIgzSCiBybjbB5MOLakLtRQxblIU
X-Received: by 2002:a05:690e:b8d:b0:676:9954:81ef with SMTP id 956f58d0204a3-67ba4c823d3mr14153599d50.14.1793894535491;
        Thu, 05 Nov 2026 08:02:15 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d48316f4sm489633485a.25.2026.11.05.08.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:02:14 -0800 (PST)
Date: Thu, 5 Nov 2026 11:02:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Thomas Touhey <thomas@touhey.fr>
Cc: linux-usb@vger.kernel.org, stable <stable@kernel.org>
Subject: Re: [PATCH] usb: storage: add quirks for CASIO calculators
Message-ID: <ba500bc9-461e-45b6-b889-3d82107e1967@rowland.harvard.edu>
References: <20261105151348.19009-1-thomas@touhey.fr>
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
In-Reply-To: <20261105151348.19009-1-thomas@touhey.fr>

On Thu, Nov 05, 2026 at 04:13:48PM +0100, Thomas Touhey wrote:
> CASIO calculators using USB Mass Storage, bearing
> product IDs 6102 and 6103, always report non-zero
> dCSWDataResidue for requested transfer length
> >4096 bytes while bCSWStatus == 0.

Do the calculators' Mass Storage interface work correctly when the quirk 
is present?  In other words, is the non-zero dCSWDataResidue value 
simply wrong, or does it accurately reflect the fact that the device 
hasn't accepted anything beyond the first 4 KB of the data transfer?

If the latter is true then the quirk won't help.  Instead it would be 
necessary to set the device's max_sectors value to 8, limiting 
individual transfers to 8 * 512 = 4096 bytes.

How much storage space do these devices provide?

Alan Stern

> Information about an fx-CG50 (OS 3.11):
> T:  Bus=03 Lev=01 Prnt=01 Port=06 Cnt=03 Dev#= 24 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=07cf ProdID=6102 Rev= 1.00
> S:  Manufacturer=CASIO MassStorage Device
> S:  Product=CASIO MassStorage Device
> S:  SerialNumber=0000xdPUBVUq
> C:* #Ifs= 1 Cfg#= 1 Atr=c0 MxPwr=100mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=usb-storage
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Information about an fx-9750GIII (OS 3.71):
> T:  Bus=03 Lev=01 Prnt=01 Port=06 Cnt=03 Dev#= 25 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=07cf ProdID=6103 Rev= 1.00
> S:  Manufacturer=CASIO MassStorage Device
> S:  Product=CASIO MassStorage Device
> S:  SerialNumber=000000000001
> C:* #Ifs= 1 Cfg#= 1 Atr=c0 MxPwr=100mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=usb-storage
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Cc: stable <stable@kernel.org>
> Signed-off-by: Thomas Touhey <thomas@touhey.fr>
> ---
>  drivers/usb/storage/unusual_devs.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index ac22fa318734..492b5f050f0b 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -1168,6 +1168,25 @@ UNUSUAL_DEV( 0x07cf, 0x1167, 0x0100, 0x0100,
>  		"EX-N1 DigitalCamera",
>  		USB_SC_8070, USB_PR_DEVICE, NULL, 0),
>  
> +/*
> + * CASIO calculators using UMS for "USB Key" mode always
> + * reports non-zero residue when the transfer length is larger
> + * than 4096 bytes.
> + *
> + * Reported by Thomas Touhey <thomas@touhey.fr>
> + * and augmented by 0v0katai <0v0katai@gmail.com>
> + */
> +UNUSUAL_DEV( 0x07cf, 0x6102, 0x0100, 0x0100,
> +	     "Casio",
> +	     "fx-CP400",
> +	     USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +	     US_FL_IGNORE_RESIDUE ),
> +UNUSUAL_DEV( 0x07cf, 0x6103, 0x0100, 0x0100,
> +	     "Casio",
> +	     "fx-CG50",
> +	     USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +	     US_FL_IGNORE_RESIDUE ),
> +
>  /* Submitted by Hartmut Wahl <hwahl@hwahl.de>*/
>  UNUSUAL_DEV( 0x0839, 0x000a, 0x0001, 0x0001,
>  		"Samsung",
> -- 
> 2.56.0
> 
> 
