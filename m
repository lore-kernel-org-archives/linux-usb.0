Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FEC301719;
	Mon, 17 Aug 2026 01:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786931404; cv=none; b=o8u/qe5c/MBmhDqxroCfuxyVPGINugJy/RIZHcnfcFWjgFJyULAGcReQjg79fpomr0Wo3+QA9Hk7Tf5aNm/CknuJHBaR2sj/IrC214MluztfiMC6KSRhDjD6MYPVSwZN6+X7Av+WUGusrqALCRzBpEScjX8UluYgWPn0Cjc4dzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786931404; c=relaxed/simple;
	bh=QIZQqoGJHbcYwaYUcvhj9FP3C+skIUfrExA1nb0G640=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=HIeco2OUJp+4spI5devwkHdDRA5AW61OMwD9ufWjM/XpzYXBCzOtVFtfq0OdPmg05Wuy3xDX3kbX+eLZ+8ypivAm6+rb9FgPz2b3QV3SZbUle0brqs37FxM3E+NtywWMjsxENdacJPW1CEajz/OR7pgInPcu7BcRxLkzt1cDNQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=B6GSMaU6; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="B6GSMaU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1786931390;
	bh=/DfEMVZLthcXnZ6ThaQ6hlMM3/3Qp4ydR+bc3/W8EgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B6GSMaU6Fj7ynRAV+L4UFwF+ielmJiCpDnfY3SZUx80+fGl78ZsFvYx4I5PcAqRfI
	 FEKPEUEGizYykSPEqjgDaKupou+j/0cxSIaGdvvFQF6iKnAy6Uan36Mlo2zsTXjA9i
	 jffAQKO/UFnxLGcFYDXZweNnZh/UxnUcS5ZJEUDo=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id C703BA21; Mon, 17 Aug 2026 09:49:48 +0800
X-QQ-mid: xmsmtpt1786931388tqxbjei2i
Message-ID: <tencent_2ECAF6933BB962811B415136F78E0C5F9707@qq.com>
X-QQ-XMAILINFO: OKZmdVNIw/gXuJLfleIxf+fKJlsv9VtrGArjz/YcpMvbStUZaRrcllsI0coLqH
	 7M9WPdLTbgv0rKKhPqU6isybY7eQYpyPHSNcTQCfJnWDazVh7Zdrg7SGKRlIGUKTNaEQEWY6w+oF
	 tt6SrsaDEi3CuxyuVPeOYinjY9vuAa66kGHyqH9AW3dUQIEJDxAjZQJlOumeCCCpQkqqDDkzYLm0
	 4pV2HRXVeMr2gDjaLbxD0xFNjeNmTE7hzQcIvtIUWjoEGc0X2i2P2z8KJy7bdmiJ1tpNAdRvvHvj
	 hsjX0npLuRmEOrnB057zvIU3sDoDjRsWQZVHDdMe3dvkq/28uQ1wx0mAOvB+BjWq8ppQTI3uObXt
	 kEkVFkSC1BlzQLEliAs3pNSrdgLuofGxEUtWIP5mZHqXJK5vp5hlpoviEIPGEHH6lOe1zrx5Tuak
	 2DdNubk+0yd8YH3nTxnb7iVo9VFi61O4FN46islpbkutB31ZXBs6ABMWnVzkXXqd0zGRumhLCd4+
	 tmvcbhCE2tOruSMA23I/8Fuy4O8iCDb14KYObq3Xw3xO+iPYsJXXR4xruXPjKqjgtDWDc603dgvZ
	 zS6uWvVUhP8PFsq4QzZ2YblYrHwz53H19lVLdwzPBHRf89R35mbiLy73fNCZlHlCOZYlvmAJ+8g+
	 N61pVevJCBkyM/2mJisfYW1yPZG/43CB2kkkQkngGaZAN/3QlOAaWmfgoEJHZrd/yp66bvXKEKv4
	 Ew9ALbK7Liolg2FVa4W/Yc1c86uvRFjNEUZkebZR25lDuj68Q9Uujgdx1fC3GO4e1yaB1bpk8QI5
	 1fb5PC4zrP6OU/M8k2jQjsyE2CnBP00R4jbUK9nobZabkkl8ZeUUXus2UR9Mh9qmIMKXItVn1/HE
	 YkXI9TGJwCfPiYfadUjKxGlDGqij0hsdNx4EUmNexZQUW/982XRJaPtk9PvxBMVyB6gGKs1QD3XZ
	 nf16GslCggHYT/H7aL12MdsNCRk7g2y/hvhLex56s1JpkzMXUxWEYsWCjlA/P5F+3Vjst/OXI3LB
	 rlFZ82Z9E0IWjwQprVVWLVW+/KseVZVHwQfcUVT5/azIYHKBurZ17LhVv7RRrnpp1YAFd4N+ingr
	 QHtMkERjs8D0UwXVY=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Zhao Dongdong <winter91@foxmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	winter91@foxmail.com,
	zhaodongdong@kylinos.cn
Subject: Re: [PATCH] USB: serial: option: add support for SIMCom SIM8260C
Date: Mon, 17 Aug 2026 09:49:39 +0800
X-OQ-MSGID: <20260817014939.69131-1-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2026081427-overcast-silk-8fe2@gregkh>
References: <2026081427-overcast-silk-8fe2@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 14 Aug 2026 21:02:43 +0900, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Aug 14, 2026 at 05:01:15PM +0800, Zhao Dongdong wrote:
> > From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> > 
> > Add support for SIMCom SIM8260C (1e0e:902b).
> > 
> > T:  Bus=08 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
> > D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> > P:  Vendor=1e0e ProdID=902b Rev= 5.04
> > S:  Manufacturer=SIMCOM
> > S:  Product=SDXLEMUR-LITE-MTP _SN:120696AB
> > S:  SerialNumber=0123456789ABCDEF
> > C:* #Ifs= 8 Cfg#= 1 Atr=a0 MxPwr=896mA
> > A:  FirstIf#= 5 IfCount= 3 Cls=01(audio) Sub=00 Prot=20
> > I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> > E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> > E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> > E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > E:  Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> > E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> > E:  Ad=84(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > E:  Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> > E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> > E:  Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > E:  Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan_simcom
> > E:  Ad=88(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> > E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > I:* If#= 5 Alt= 0 #EPs= 0 Cls=01(audio) Sub=01 Prot=20 Driver=snd-usb-audio
> > I:* If#= 6 Alt= 0 #EPs= 0 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
> > I:  If#= 6 Alt= 1 #EPs= 1 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
> > E:  Ad=05(O) Atr=0d(Isoc) MxPS=  34 Ivl=1ms
> > I:* If#= 7 Alt= 0 #EPs= 0 Cls=01(audio) Sub=02 Prot=20 Driver=option
> > I:  If#= 7 Alt= 1 #EPs= 1 Cls=01(audio) Sub=02 Prot=20 Driver=option
> > E:  Ad=89(I) Atr=0d(Isoc) MxPS=  34 Ivl=1ms
> > 
> > Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
> > ---
> >  drivers/usb/serial/option.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> > index 580f06f5ce5e..9c1444af2c61 100644
> > --- a/drivers/usb/serial/option.c
> > +++ b/drivers/usb/serial/option.c
> > @@ -2165,6 +2165,8 @@ static const struct usb_device_id option_ids[] = {
> >  	{ USB_DEVICE_AND_INTERFACE_INFO(ALINK_VENDOR_ID, ALINK_PRODUCT_3GU, 0xff, 0xff, 0xff) },
> >  	{ USB_DEVICE(ALINK_VENDOR_ID, SIMCOM_PRODUCT_SIM7100E),
> >  	  .driver_info = RSVD(5) | RSVD(6) },
> > +	{ USB_DEVICE(0x1e0e, 0x902b),
> > +	  .driver_info = RSVD(4) | RSVD(5) | RSVD(6) },
> >  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9003, 0xff) },	/* Simcom SIM7500/SIM7600 MBIM mode */
> >  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9011, 0xff),	/* Simcom SIM7500/SIM7600 RNDIS mode */
> >  	  .driver_info = RSVD(7) },
>
> Shouldn't this be in sorted order?
>
> thanks,
>
> greg k-h

Thanks. Will modify the order and resubmit.


-- 
Regards,
    Zhao Dongdong

