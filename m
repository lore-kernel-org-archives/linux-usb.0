Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402048;
	b=iWu3FHAfh/XKRO4U0ZT1lSuNdH0VRnay36gWqjYtAdTBMSPvLONn7/elOv+0tXwvZ2ED
	 /BF2uko+Yqzmb5dkbSC2B/2vD5rh3hDHyJc1lXtBYlo5oTa+L4rkIz3ed8gJWlP16SatQ
	 jda9S48vRq27QTSm7v1cjQFyNNqUPed3DLeZ8nvxXGNu33vmyUgP7EzPoEZxyJXlCdbeZ
	 B/0WUtNOapW45S4t+29/YJ8xSDoku61jf55xzmruAtMyMhwNpR4wRbQ2/Aqs5QtexiZ1b
	 H7R07FOnkQV/XQhseP5wDxvGLIv1RVJ2KKrKvxoLs+mKmbloTW3vmCHhCpwT3R/GUJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=SFIoqBjnlbvZCjChyTyM5qELmMy/lkQiq2ftUIfNk10=;
	b=f9r5XK0VvltRcy8EMCgsH0f9qKBioH9VYuaigY7itLEs/jXOyJM3kr1f38fyIPHHA3ZU
	 odmdthdoVsV0eUCxpvi/0qxq0Tz/gZu1mIQSXnaR9ey9DrZ2vNlWcVwgsqHI7rqbzP+rc
	 VE9OTOv9C4pu/EqLxywyOJpBfv1q9KF4eLA2TFygkk4jTptryYzAqbpswVFQGeNlzrngE
	 wPwmudUtIVrlh8nBgf4Z/mvIxYCPTFpNiKhXroUN+IyL3INd3Gvik0pGPNT9rQ+0HkFeL
	 zbBiz9otZAaJ/cqFh6PiD7XohzMXEv8DWZXU/E5xR2ZvlThsP/Fa5wn8i2IC1k9uxrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1hUS8nb;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2331E606A32D
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 13:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2331E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1hUS8nb
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so3059724eec.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 05:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402047; x=1795006847; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SFIoqBjnlbvZCjChyTyM5qELmMy/lkQiq2ftUIfNk10=;
        b=F1hUS8nbidigRDtk3g9zoOUgSLYoMzz6HryUwGNGS+lBAGwSJOGzaSojl7uTLjwvtw
         NeFW5pu2nI/QBnnMTkr6sEgyTv1vebsrPnX3Pb+uc75ElQZ9fAuLfwo1ACD2wM16TOQq
         tzD6LAtOdWAJEvUKSEb5HstfDY99nYy/K9JWOI11P2UmSWCFkZUprnLqPhRra42GzDOO
         XbDHb6GWUbum3ccG3UCvUNfxQlYCp+jtqqErvRU2o5LvEtZ0P52SvwRgIgRaqMYnJAfl
         qaysFZJ8EvDuecbSl6TRYLfqXHTjAxwBiHt2lkmaogGFNDqdZUKNz3o7mk8NP/NCSOo5
         UWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402047; x=1795006847;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFIoqBjnlbvZCjChyTyM5qELmMy/lkQiq2ftUIfNk10=;
        b=z8SWjNBrCGGSLP6Nr3HE7CPoMnPvX/SmOwYb5zBatYzgqnzZ+vXRjFT6CmXHwo2gR5
         QzY+tPLNgUjEQ9GylCl54eMEWR/0pks/tDVLLauV73rLRYFMJHfyCH+OZCbYddVLCyMD
         rdJn5O2WMbomFinkvS42ELIpP0F4hcLDPB1XWSfczHORFLmWFKmgEuikW8SfLd+xaZ+9
         1XQ40NaqGqmaFgdHdOgrMmXx0E+LZZTmCW8iM3y2A4ATjRU26sBeURux7tWOlneL21tX
         Gh+zB7e0DXHWw/zAP5wrY24rsVLDqvvJ/wWoASjTxsx9kkOhnz6rsLLaXkyqHAWC+r1t
         jvPg==
X-Forwarded-Encrypted: i=1; AL+hErGab4XLEd+tNy3o1kOUYAs2oGfdCzDT4V3xrwDQVcRzZ1mbBxl2fQKJ+jSAkDnBTc/uWnLXqPX1rwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jGrXRgtWvwHvqLSlEVV3fG3xqU6YsmBXKQx6q+ufiIUs5SIkL
	aKP19b+3EPNTYBTQ+KBjJganRR9vqZJmHJB5qTf20/RBVcrcxSd/Sspl
X-Gm-Gg: AYBFou2Ou+oo1jM4SSGM9ZTNH+j6D/SdbRjkzT++KIBBSuUQ+iR0LUcMa4YRoW7bJkr
	9yXvrYY3WPnBGPdwrC3cBwwhyOYJIMr5F+1TUZxKPpjBnt5Boe0xpFYJJ0KWmY6RTU39ZJRDcJH
	4CHF0he3lebvPci1k/GR/Y5PG33Kv5Ed0/Hn8X08f8KdHPLraNjmPjUXTytPVhQA1YbTIiXkudE
	qg4fC8SwLGqK81HwJVOPF4juBhbdvk4tqC8n1zc6ISihBLGVaiK1BC29FUUsftQxL/hUo2vZQ1g
	P/IN6SoUzd9DZBr5d5eCRk8MOG7ywx3Q8u/o6cdTSoCoPnc59kkdTciCVFb6i8ppNRGB5lDoi1q
	OcDATVg+V6Cda0y+PZhybaeugqYWP5t5JWjKVL9+bFnIgf7rM55+oYigGXIOSunCtIOcneyhDA7
	ygBslxKuL0e1DMGyaNMtSK/HQ9Q8GuUlm2nQNEi/zEY9nm2w09nwEL+6my3mRmqOdCurFZOuj6X
	bOuXxnoRlvGnYacl4UJtvro1QIuwMwhNHmOs5qOhbYIvX/jwsFeGOJAZ47s0SuJ5t05XCkIzXcl
	zunWGMepewtfaPN4yezUVOY4aEc80fWqNrtvLw==
X-Received: by 2002:a05:693c:83dc:20b0:36a:437a:4c00 with SMTP id 5a478bee46e88-37685e6ae71mr3149122eec.24.1794402046818;
        Wed, 11 Nov 2026 05:00:46 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:a1ca:3ffe:3076:4525])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm26438801eec.22.2026.11.11.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:00:46 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] USB: legousbtower: use stream_open for stream
 semantics
From: mdshahid03@gmail.com
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mdshahid03@gmail.com, starblue@users.sourceforge.net, 
 legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <2026111054-reversing-gurgling-94fd@gregkh>
References: <20261028182802.25212-1-mdshahid03@gmail.com>
 <179433189678.152716.11457478975708955224.b4-reply@b4>
 <2026111054-reversing-gurgling-94fd@gregkh>
Date: Wed, 11 Nov 2026 18:30:21 +0530
Message-Id: <179440202172.231301.13877269286726215478.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi Greg,

I did basic sanity ,I build driver and ran smatch after changes.

I don't have Lego USB HW to test it ,but there is similar changes
in Xyllibus ,that was sent by me and Eli(maintainer)has tested in HW.
According to Eli ,There is no regressions with stream_open().

Here is discussion:
https://lore.kernel.org/all/24af6daf-dbf3-5c47-beb7-077c4473ea7e@outbound.gmail.com/

Thanks
Shahid.

On 2026-11-10 13:21 -0500, Greg KH wrote:
> On Tue, Nov 10, 2026 at 11:01:36PM +0530, mdshahid03@gmail.com wrote:
> > Hi,
> > 
> > Could you please review patch and give your feedback,when time permits.
> > 
> > Thanks
> > Shahid.
> > 
> > On 2026-10-28 23:58 +0530, mdshahid03@gmail.com wrote:
> > > From: Mohammad Shahid <mdshahid03@gmail.com>
> > > 
> > > The LEGO USB Tower driver uses nonseekable_open() in tower_open()
> > > However, its read and write have stream semantics.
> > > 
> > > Use stream_open instead to mark the file as a stream and disable
> > > unnecessary file position handling.
> > > 
> > > The issue is reported by stream_open.cocci script as potential
> > > deadlock between read and write operation.
> > > 
> > > Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> > > ---
> > >  drivers/usb/misc/legousbtower.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> How was this tested?
> 
> 


