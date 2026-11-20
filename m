Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206657;
	b=zHndNxQi1yc80BRWYUX7tis8eXbDMg9NLldqfYHR9yetPhQG9IuTPPSPom4WLgZc84SR
	 ZwJzATFrHaHoWdnatVF9UUPO2vp4ENtF2RrLwGE7CIoRxGO2fUEoVTdvtm0DX5rLRqe4P
	 7RFGLktccPUrlX/7pC+WjdfRuh3fG5QonmVxRS2S7W4Sr/nTRpzwov7PrD7SBule8rF4H
	 x18ctB2SzYlkslGKjDLc3fDmdOXtKFvSUFFBEMW/viIjsmhyZL1PAQiZNMx12+pfAJDGA
	 AlJCIhhNLyM/sY1fj51rdYMLRp4yaedwSdIbav5pkXoCfCrdsihsJm6PaAe9LOMZl+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SmOVzPTxZLEPzBlb9pJmyycy/swtGBBs1iU1TcCQUmE=;
	b=a6Qh79q36NP+g9y7XoJr71HgtFjnTDJ/60MrdQkUgelh8aWuK8VZ6DdJvoUCpcEhcubq
	 1Y9nM6UnRwiF0c8CwRTyO/Smol3oCr/4kF+OkVrgVaAl2XQgEh89e33V0CvrytjRGDga8
	 9feYYueLh1lydL33EJVpjlWUWr2MMZbZc9z+jfIZRvLBVJZKlbrzH+lXaQr3Lqqyr2vjh
	 E4zl27p4UAd4aBzf/yDa0RS/fikj89U39TGvqXlQh+GERasQhNJhMFxZo0MEV+T+AP3wy
	 OLeaNoVxucWPeCvf9wtSWhyKbTbty/eJtjF0OdVdJggY8BZG94nuZtV0dLWUec5KRZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XnTyMdLM;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49741606A6F9
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 20:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49741606A6F9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XnTyMdLM
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso22606135e9.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 12:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795206655; x=1795811455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmOVzPTxZLEPzBlb9pJmyycy/swtGBBs1iU1TcCQUmE=;
        b=XnTyMdLMQViLqocCLy7l53u8I41tA2MqvkXvE1ryN5Z93y0PQUUVutNe+V0SYZODNo
         IXOp2PMyTFBKAByn+kk8n+1UM6AsOe9ZTmGeo7szboOffqEXblHUO5/NRcnuIetCktYH
         IiOYqiGnV8VWUNSpsxYnxLK0zHHALVlrtZ+PlfrfkCt+Acv4JzpuHR5FFmBKZEGQ1Brs
         KqSV6GUXCPjpvKYW9KcNc6JK7RoukrvbWJ+3y/SG0u3U1+ascXEK5zVPE1a5R7j98pRi
         RebOYAbmMNumGz/ScnXgseJWEUW2jR272d1b479fCcLrbmUktSCblyWUrYM15Yqey69/
         XMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795206655; x=1795811455;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmOVzPTxZLEPzBlb9pJmyycy/swtGBBs1iU1TcCQUmE=;
        b=pDaMubqh9vsu3B9F9NaDB87cF4ofk80VBI2xmzqp/X6Vhw8EK/EEAl6WJCr/NPjmvx
         dHxOltLg6d/JLuzRE6+1oe8T42jCD1/O6VsZnUhBe1nCPMfYXHMAexA/MXc3KCoBp2Ej
         pu7eDwoWR1CsoLcwtUY6VxO2StevzQ7aCPp236+KCTYN78s4+ta2zkdhvIql7riagEF1
         C7nhlEZhkuFDKhF67xxovb2FZPpboh/uTIzHByfP44aOznIIKJwa3nnUBYCy0quDC5Kn
         DMv+GnmaCaq4ZEYEEPMHdV2bTcuWma26r3iuiWA9uW3FQm1k7iPhuq1ybJkVibMmw3VD
         Vajg==
X-Gm-Message-State: APuU4Z+Yhp2ij8zWXhKHScOvb6bftgUN/aAm8Q/agGX643u1xsKigH22
	Qql5QFwi51LVDzqC5LvAiyiL4RnabdyJMdBqD+tN3if/DqmmP72DmLPz6Pv+oQ==
X-Gm-Gg: AYBFou0ij0LL5iSGtVGCblNZcAzjk0PWvqyQy3E69z/cxTwDaVcjjcOhQ6T8UQEpLzZ
	vXAUSzLl0AQxAxWmZHCpGTmD1Qebrudzq7nWfNOyAT+3sVxmXJ2DF8K5RzzJgdCfEx3fF5L4fZA
	8CEBSAqBZSJqLXtywdYsaw3Me2DQp+NSU7A5j2fNwYxa7WFlf4n3DlD7pG5y64B3/EZX8BtWzL/
	pwO3oYmtEZ9oUXV6qhF1ZUPWaxCuKHgzjEWWQGNL7BezvI5w1ZtjgKNbxSjTXrLkZT3lu8xyfND
	/YyAZbyUAK/DO3OPioRWO2yAfEmbsPaFpeBz3bEUoW0KGGpQ79aMJ4jYc8/JRJGN8qstKsXuWlt
	7RptTBznkGpAGHFh9MCHJhvpp5r7zV4911FB9iRKXEUdFvJ8YyeJ/ohc8CUoXmQ+o9iu/XCD9BO
	aZpsg2miMtyCyHNHYqyrIcmgBohbKvRQYGaKZwoHBRH9tJija+ih1SPJOgJJXe1KeI7LJa249VV
	3UbP/WhwHK+Xgh5HT0zA7ioB7jWa2Qe7miKXdEvRbwkMnOl5t9fhnfeSVtkcjvy1EmGBWbeIbxP
	0rXSmcpXwq0SpaKOZaffZdcnRZfdxGq1oBWOKFy7
X-Received: by 2002:a05:600c:1d83:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb88805c26mr86419975e9.8.1795206654499;
        Fri, 20 Nov 2026 12:30:54 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm113647955e9.7.2026.11.20.12.30.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2026 12:30:53 -0800 (PST)
Date: Fri, 20 Nov 2026 21:30:50 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Gabriel Ilie <gabiilie95@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com,
 linux-sound@vger.kernel.org
Subject: Re: xhci 8086:7a60 (HM770) skips ~9.5% of isoc OUT packets when
 hot; HDA on same PCH underruns in step
Message-ID: <20261120213050.18641baf.michal.pecio@gmail.com>
In-Reply-To: <CAHJAn3zOCh8oKjE9fVbeD_XbnSG-h8psZWan9qkNji_mps8rFA@mail.gmail.com>
References: <CAHJAn3zOCh8oKjE9fVbeD_XbnSG-h8psZWan9qkNji_mps8rFA@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 16 Nov 2026 16:05:13 -0500, Gabriel Ilie wrote:
> 1. Is a periodic ~1 ms inability to service periodic endpoints a known
> behaviour of the 700-series PCH when it is hot (PCH thermal
> throttling, DMI, or something else)? Is there a way to read the PCH's
> throttle state or temperature on this platform to confirm it?

No idea, but it seems you found clear correlation with temperature.
Maybe the proper solution is more heatsinking and airflow.

> 2. The controller advertises CFC (hcc params bit 11), so as far as I
> understand the isoc TDs carry explicit frame IDs and the ones whose
> frame has passed are skipped after the Missed Service Error. For a
> UAC2 async device with its own buffer, sending those packets late
> would probably be inaudible, while dropping 1 ms is not. Would using
> SIA instead of frame IDs be acceptable here, perhaps as a quirk or an
> option I can test?

Somebody recently added quirk flag "PLAYBACK_URB_FIXUP" to
snd_usb_audio which submits playback URBs with SIA. AFAIK there
is some way to try those quirks with a module parameter.

It may reduce the number of missed microframes, but I doubt
it will make the glitches inaudible. There is no such thing as
transmitting an isochronous packet "later", it must be skipped
if it doesn't make it on time.

Regards,
Michal
