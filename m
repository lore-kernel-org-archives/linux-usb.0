Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D66C22301
	for <linux-usb@vger.kernel.org>; Sat, 27 Jun 2026 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782547557; cv=none; b=TFDxR5NbJFVKtyqUjBHFH+vvD1aKiBVsPFR2lwiDQRsNRHi0qwqHtSuiFjwxXU5IK8PzKdfD2RS1219EJ8sXawxgeVr3JT/bqTjj4koqvkDu4RWDusd17mw35sjpBb9jKJLrnvBcwT4RdeD22gftp4od9hpLwVBenc9L6KLlZZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782547557; c=relaxed/simple;
	bh=j/Xl4kwFwWvXTM0tHrO44j4H0IkkAxvBpnBtTQXaQJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePo1A3EVSUu1C6jwd0R1Ldyy+gePYS6F9VelN1nxXCWL07rw7I3lLx9hrAE/vJf9PoCO2XVtxVDADkss9Am0OmtMu/RNdYGHQ+/ptzRq8tpEAVVK2uaIYKILTSv/F9EjXNWXUFn/9b9H7HOBcRq/dxhUEP3/YA9wA45vsWWqrtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UmnnaJMO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UmnnaJMO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso22080985e9.2
        for <linux-usb@vger.kernel.org>; Sat, 27 Jun 2026 01:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782547555; x=1783152355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t4NDdoo7VQVHyApqxTqIsm71UvInn585dSngC/ZVGPA=;
        b=UmnnaJMOOTkItl60XfPsgHzApKGI0QO2oYM61ShiVWFG3sRWm33S0SAXS63sVKKHBd
         G9ujU6Rfxq2mubDVqH61VQuId/QD0vGEqkPZtWkCX590XFmA9vyCQWacF3YAsMB5QChD
         vWjqcwQucx+3M7K2AShU2DF+j9X4ZKcgUx2RPvcKw2wT8jcM8qfNC+kj40t53eUDc0yw
         MNRsRClVxKFN49RAL+NHEUPyGNgO1jPmDTl6kEjmYHMUL9A0rvB4yKUy8YfDy74QclYD
         QijN79FHJgvyfEn2jrYQu/x+BLAMt2oV3xFR+MLuUTfpU91cl9TKElYtDXEEgRuZJFbZ
         IiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782547555; x=1783152355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4NDdoo7VQVHyApqxTqIsm71UvInn585dSngC/ZVGPA=;
        b=WzQ+BIadUEEviQbDRR6S5FVoLmge6Dou80lm6WTVtGbK+St5k0PqAFt1rtnp9zVkg0
         gW7oAh1TrvlKHv3y1Mh9/chRvBrRROXhsTvlYXeNZqZ4+3cy9iUnP94szR3MGM5KqXWt
         QFT0KGCw1xujmplCUopTQJ9nWIfvxG/GiCi7txH2FHBgm/sAk82vwF1jE1RTmKOipx0T
         sgdzJql9ZAsHbFGnaV91IoYxNnbWnAq35hNyB1RuKLkJOQ80RS4SluYIS+DumUZL+dIK
         ssSFSTuDHMtpusEsnuWGRd2IKUiBYnN1X7yomFjcoqubjWPO7AD14KSDwRmxL2y29sp9
         yYoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jbo04Xxa7GwpXL757oEcZgh2OX5p4p+W/0hVylY3XY7Cl1VoSsZYhCOly/YqUWXmYLByBkozt4kA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Q7UNwnzKpu9pAtFtV3s5tIKXQOGR6o1FhdjAbc8bCsGwHgcQ
	ryTmMtpbGM2Nvp3ApU4a/6yxJho4iYbJ0X7/xsa8cGWSA6ppCf4KZFm5D/8XycL2/8g=
X-Gm-Gg: AfdE7cnPWBtZk8bWBRRMcYtUWMBTl2MBEXxsZaBAxTvWGcLp9EfeoCcnHOBFRlcyhGY
	cqzSxgbjmzH/DpNF0prEj1wahEVFtZjtnggmJUD6+ODDNn6NccHX75wCF3PjDStHWfmq/ma5lUh
	ruE/wwAwRAWvmaU48wNYnSZb0Ty8tfoIrDz0LtY/JqncaPhJpnwcjhOUbX47CDxnw11+sJOJ2zr
	oViCM8WlA1fkhlN6agp8PwVdsfWpKsWeJho2i6zJrA86ERC3zcX68GkEZ3GeMUAg3hlJRduwsww
	0SL3MRP7emYkzbaR9WqqJDr5ryHkE3g3gxqLX1tWoh/E8PpXdKxzIS+QbebF+WOnaAicEVV8F7t
	rVVAawCCdSFBWe7MlnYQWssEpQaqMrnXBiERstlr69jvM6MocjkyFRfsbgLIgVtBaXJdh5SZshx
	TIVCWP2+X0Ftvkc85jpJdqjdKaNnFd/nClZhl2jPF8VvCbQUCwk40xjGk=
X-Received: by 2002:a05:600c:138e:b0:492:4668:27b5 with SMTP id 5b1f17b1804b1-492668322bdmr143874025e9.6.1782547554944;
        Sat, 27 Jun 2026 01:05:54 -0700 (PDT)
Received: from ?IPV6:2001:a61:1308:fa01:ae89:c78b:2ec5:c819? ([2001:a61:1308:fa01:ae89:c78b:2ec5:c819])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492690a1a85sm242880935e9.15.2026.06.27.01.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 01:05:54 -0700 (PDT)
Message-ID: <806cfa93-3fbe-4655-bdc6-913eacba3229@suse.com>
Date: Sat, 27 Jun 2026 10:05:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: sleeping function called from invalid context in
 submit_async_request
To: sanan.hasanou@gmail.com, gregkh@linuxfoundation.org, kees@kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: syzkaller@googlegroups.com, contact@pgazz.com, willy@haproxy.com,
 ksenija.stanojevic@gmail.com, sudipm.mukherjee@gmail.com
References: <6a3eee6a.87857ece.10923b.6588@mx.google.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <6a3eee6a.87857ece.10923b.6588@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26.06.26 23:26, sanan.hasanou@gmail.com wrote:

>   kzalloc_noprof include/linux/slab.h:1200 [inline]
>   submit_async_request+0xd2/0x9c0 drivers/usb/misc/uss720.c:137
>   set_1284_register drivers/usb/misc/uss720.c:237 [inline]
>   parport_uss720_write_data+0x70/0x130 drivers/usb/misc/uss720.c:337
>   lcd_write_cmd_p8+0x94/0x7f0 drivers/auxdisplay/panel.c:752
>   hd44780_common_init_display+0x188/0x4f0 drivers/auxdisplay/hd44780_common.c:124
>   charlcd_init drivers/auxdisplay/charlcd.c:585 [inline]
>   charlcd_register+0x1e6/0x320 drivers/auxdisplay/charlcd.c:652
>   panel_attach+0x19f9/0x1f20 drivers/auxdisplay/panel.c:1644
>   driver_check+0x51/0x60 drivers/parport/share.c:158

Are you connecting an auxdisplay to a USB parport?
It seems the issue is that

static void lcd_write_cmd_p8(struct hd44780_common *hdc, int cmd)
{
         spin_lock_irq(&pprt_lock);
         /* present the data to the data port */
         w_dtr(pprt, cmd);

assumes that you can write to a parport with a spinlock held.
uss720 assumes that the method implementing that can use GFP_KERNEL.

I am not sure whether this was even ever defined.
Adding relevant people.

	Regards
		Oliver

