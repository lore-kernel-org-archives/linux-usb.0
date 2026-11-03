Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793677752;
	b=HlRvE1wjLtdHb0XalXul3YOhlteA3zCnu/soz3TUcqFMMUqZHrXNV9W8iBtQLYR366NM
	 Gz9E8YEhKv1RtDHoDp8kYJj7Q7E66OqihNa2ahy/TuqXdW/DjZ3r+o/yQpAlq+t6pe4mq
	 oRe71fH2QZchaz9YlZrdsajatEF51bFPUGO11+1iRGXZ0c8Av0fqFTYOnxdq0Ne9rs/L3
	 ZmibEXZn3Psjbxdl13ABYLLkbbATYXTHHrVE1/9LoybJME/HscwfNdxds1lq2SdsfwxjR
	 SuQFoNCaQs5XKaupcpXQCALI0C5wHC52bZkgeOjyphhTUGD4IgNZniUEYUSJwMTTSdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793677752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xlANKc/hUsDyqlrzuS4pvu9SPatWxo1EtaTcINdrPck=;
	b=w/OdjkhR/b4XS6HJXjv+8twH+xi/WNpvp8SZKj3ZuJmKlD3y1z/pugKxqtEAKwSkV1lM
	 o+qgoH88hIeRfIv2FdtvuXI9LgswQ27nKLqPHRwuCPE23mYVtvYombxoRkf6fNYRXSBzI
	 J0eKa2X7nUHBG3oXdYcIuf9oKUBXru82KeWIxV50Bki74mWAdX5eEW0Ov1jno3BOcvaHK
	 JGgtFGmHikbebIJN4JAy8cMhDktYL693AsTT9NgoH+ZcCKQ64yTLf48OJFclCss/lUk5s
	 SpvQInpqR+TmaaqYkwkNmr4l6tx0Taw744EDqAv+a9TNLHSM8n7ZKX6vUOqOp78Tgtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="hC52/YqU";
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F27C606A329
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 03:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F27C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=hC52/YqU
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93cc1ab5f6cso448683785a.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 19:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793677750; x=1794282550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xlANKc/hUsDyqlrzuS4pvu9SPatWxo1EtaTcINdrPck=;
        b=hC52/YqUVgi5zyfeZsh2Sa1tBvxb6geWgwGIsR9akKn7Qd8A6Wm9GYov0aUhLX80LG
         /52Z9KUU3EBRRpekphMoymY8hS7Sni+RjFa7eVGSPoWRCG4edwqloOFBhbqs4QP8Y9FN
         WMkbYiIz7cwz2wQsHX1tAr7EaaiyvR7gLZeUVtgThYoSVEmWB+Tepx2qPTOLWSzkw4ou
         zkAMCBYwfTz6AXMrDVjtH9+GEqfybQIUb+n/Rh/dR1VeLo4Sd1cFqDF2JyVuy/coCOJr
         EWzBH76iTxP3nLEXrVp8bj+kajI3KrE1eurboGLqz55lJSy25hjdrvCfbWnX7K4cdJvp
         MABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793677750; x=1794282550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlANKc/hUsDyqlrzuS4pvu9SPatWxo1EtaTcINdrPck=;
        b=v6VCmAPW6XbthxjnQooUkc64tXer7lK4PY9GcPPHiJGsSHXxy0l0t9qWleURdxj7vv
         TyEI4at35ettCsQnL2Tc8DWw+krd5aOBtt5X84SlJYw9QNuEdNdcwf7/0O7EfXHW3J5t
         foTKns2myPuGNI0HwkzKsG1NO+IPOa6ZwFY1C6Egh+dpZSULVu+MCSmXFc2ekAu2iMys
         rxy3hHwFmP2Rdeb/eBn4B4jgfRb+yb3EH/9wakPgzPGB4y/3kAm0sDaeRZBDaB8CYKv6
         nu9nZN+e7savEm59LQ8ZAs88MJ3fKu10oyz2P0XYxvHoWW3NmQzmdUfmvlemfJIFUOyZ
         TeQg==
X-Forwarded-Encrypted: i=1; AKwUvBzdTdZ44Prbz92KinqfB+HS0wB5gSzJYrUQCRS+5brnYcAdjw2ytcE917fQE1CZy/zhI5sXgnwZl7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmsx4b+VI3cIUAW+74Ssubb3OIpvwS7W3ZT1B5QRlHoq6C/ejo
	EigCGfjo5mwbcYg1PQTz0F2XNMNU7oWok1GtQqiTIK5B35HpCZFqABQn7eOrObsi0Q==
X-Gm-Gg: AYBFou37EaofMNZVcuBKtn1nRwzAwji3aUoEiBHkdHrOP0tbhKVbflfz/LGL9t4YtCx
	eXGZSctu/sJEPzoomgktZnOV5JyLkcpsYgR5cioTv4oiFpF7INr+FH1kD78GoYzLJYoCdy8kj6/
	JCe6jMr8eUq1E8cpiKNhATpog1sv2unG8KE8RuWpAEUdE9gsUD9tzX/9+flycZsvXdEZEglWTBP
	MIDGVQOCosN9PJpv7zNtvzBgICeXji03R0KMAzw1ZfxzHjwtbb6BPCGbglExtXAeJHpIhy2ZZZ6
	1j7g609CAGF/O8BYZVXUdVGP8r3ds1IKr3DtOJYQ/2byVoElLcpfPQIGAWdI+WaUlUJc2EpOLzG
	/Gps8XnmtYYY3L9/n3oQ9kaI8vv09hqlGSqnRF3JdM75mx5CEctr14PAcItDP+jXhyuF15wRMZb
	lHAo6Aavi+x0PigrNAlLFJiYp8Oqm97xnW6iCDGeAB/S1BmKbGjVDRqfysUDx39TwThSzxBzpgh
	d8sbsBw0uJEXm5hRJF+k0Jox6Vmna68KvEfdWGHTuGTQz5Ev7Sw5smdfIzcbh3FsQodo0wafG2J
	xUAb3DtzaeC35ubREYlOuaPTDwBF
X-Received: by 2002:a05:620a:370b:b0:93f:1af1:7951 with SMTP id af79cd13be357-94421729826mr1933039785a.66.1793677750486;
        Mon, 02 Nov 2026 19:49:10 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425a6b9b4sm987221685a.26.2026.11.02.19.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:49:10 -0800 (PST)
Date: Mon, 2 Nov 2026 22:49:07 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] USB: ohci: ohci_pdriver.h: fix missing kernel-doc
 comments
Message-ID: <02148858-defa-4c15-92e5-0ce7029bc000@rowland.harvard.edu>
References: <20261103014710.2451967-1-rdunlap@infradead.org>
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
In-Reply-To: <20261103014710.2451967-1-rdunlap@infradead.org>

On Mon, Nov 02, 2026 at 05:47:10PM -0800, Randy Dunlap wrote:
> Convert comments to kernel-doc format to avoid kernel-doc warnings:
> 
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_on'
>  not described in 'usb_ohci_pdata'
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_off'
>  not described in 'usb_ohci_pdata'
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_suspend'
>  not described in 'usb_ohci_pdata'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> v2: move all kernel-doc comments to before the struct instead of
>     having them inline insidet the struct. (Alan)
> 
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: linux-usb@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
>  include/linux/usb/ohci_pdriver.h |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- linux-next-20261102.orig/include/linux/usb/ohci_pdriver.h
> +++ linux-next-20261102/include/linux/usb/ohci_pdriver.h
> @@ -13,6 +13,10 @@
>   * @big_endian_mmio:	BE registers
>   * @no_big_frame_no:	no big endian frame_no shift
>   * @num_ports:		number of ports
> + * @power_on: Turn on all power and clocks
> + * @power_off: Turn off all power and clocks
> + * @power_suspend: Turn on only VBUS suspend power and hotplug
> + *                 detection, turn off everything else

It would be nice if the indentation for these new entries matched the 
indentation for the ones above (1 or 2 tabs instead of 1 space).  Aside 
from that:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

>   *
>   * These are general configuration options for the OHCI controller. All of
>   * these options are activating more or less workarounds for some hardware.
> @@ -23,12 +27,8 @@ struct usb_ohci_pdata {
>  	unsigned	no_big_frame_no:1;
>  	unsigned int	num_ports;
>  
> -	/* Turn on all power and clocks */
>  	int (*power_on)(struct platform_device *pdev);
> -	/* Turn off all power and clocks */
>  	void (*power_off)(struct platform_device *pdev);
> -	/* Turn on only VBUS suspend power and hotplug detection,
> -	 * turn off everything else */
>  	void (*power_suspend)(struct platform_device *pdev);
>  };
>  
