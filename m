Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A48392C52
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415502; cv=none; b=QVHAnSlOIvHdPHPfmSqLFcjrmuHFB4945lKMvX4uOaIm1NFrzk8vAGJ5aoR8n8p78McEVr9elJOX6vDkQwD/VKplqV3A4Y8rCgkXHTvUQILqcU7rmZzmrN4BE2zptqcUT2OL+SlW257QYSpjNDNlMpjRTH4KfYhSA+BIb9iLmCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415502; c=relaxed/simple;
	bh=ZMbwppaEOt+Q4DVo9jrvDNtl/WKltKL0JxXqxucsSjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LGjOiicehiamcc2GpYKv2sW4TpPTzXWfq5EegQYWb2csmjLPbRDflHGchNGA6aKSORkhfdV1UbImm6yT0VojSpux+QRQbFj0hrK8i2meK0+h0n5Ws9QAa+JylojojlHstVREldpPXfqW++fB9jYzcpAs0RdXKMV/OBXtnZkS1OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e3uKYJ5p; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aYTo3t/Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e3uKYJ5p";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aYTo3t/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783415498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5RnetOGjoSbZBofYUofFjQ2y5JiYAZXkRIu1Tnosi0=;
	b=e3uKYJ5pnJn8nP6FWU+PP8f/2SczpTCqeXQuHdY2N6qFH8Z0WErkRTAlpHMR9Y7uZ3wZOM
	Elv/JGimMuCsk40C88q9ENSG/kAZmJsLnZM5s57JtQ5aB85l9Z/pgid/dvw2lYGteOQNHa
	DDSd+ex7h7Go50nOLxNTLIEbqa1pJ+0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-ug9MXTWrOaSEVLFWEAhhLQ-1; Tue, 07 Jul 2026 05:11:37 -0400
X-MC-Unique: ug9MXTWrOaSEVLFWEAhhLQ-1
X-Mimecast-MFC-AGG-ID: ug9MXTWrOaSEVLFWEAhhLQ_1783415496
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4926fa2cb17so4006255e9.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 02:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783415496; x=1784020296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z5RnetOGjoSbZBofYUofFjQ2y5JiYAZXkRIu1Tnosi0=;
        b=aYTo3t/Z0oRS1+kuh7AMzcuR+wrejQ5ToSRvmcOzkyMZCCmCBKvOZRMAkNNp5O0jTl
         yu64Q9tu4RITZoOqj0ec4Tw/KnwYIXJoCz5Zcmwg2eEm6njbpLZyAME/EPB/R/EuHzAl
         dkwsHyhN0j6OviCFx0g0rO862McvbRx7fhiXnavosT2UCwbQWMTdqeIRQNfUb2F/H0z6
         ec05rh6x8hUNez1csf9ytvhFvLu8lBXy7IWtuom3nRU6JS93IH9YHTb6NodFaM/7V452
         qmFpSVpP67yTAiN4M0IS3n9sBQOoxRqGRbRp95X4d5oxLU9Qh/nKldugiqLanw+pAAyB
         JcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415496; x=1784020296;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5RnetOGjoSbZBofYUofFjQ2y5JiYAZXkRIu1Tnosi0=;
        b=T2JNr0GpEsBVy6xoCZmQpBBlpn9TmCmXhtTZEeesru6WlIMEKlfevMijAhek091GAO
         CnpFf4xg3kfwLnYIyZdf6cch+WKuOCuHckI1WJguToUp0ForVW3DSISv0jGFxsAMDKPG
         GmI19TWgL8V9ZFsAnN3U6dtyu/ZJ9VK/EqrChMJNzN2mIhNo8gLNnaBdshEgTDzLMZIx
         vgj0iEbYQgwbFcU1YwZY5+8d6P4kW/lszFHO8yYAbcImtQCEDnvnUpqW/Ly+3bTpSSSr
         pbVEYaWw1B7aAr6mR1OzYFGmSWzIAqe8WblXG3dMqMg2PkatcSOJsC4q/24imkRUoIrG
         q36g==
X-Gm-Message-State: AOJu0Yx1YZePtagYLrFf4OJKcf/8HY4+JQd/R37NfE59TFfZLbWQHW8o
	V940XfefNd+kgDcaU09kulXhP7sR7FjD5Wug5LofRMM/scA6lAVeht+2CiM17iRI9ycl9/8G8st
	yZ2V8ZB9bHZPSs9UrjX2ivxUwD4rjmhUKH+IcNiTt3ywM5jJeqelBpzBspJStaA==
X-Gm-Gg: AfdE7clmq+Vk+mA9q3oklnUY2Hzot4F3FxcYnIGU8WA2Dn+cGFSmlRdg9W6cIodWSQN
	mKAsliVqwkkHJbqmSl9oCfkQOF55V1L+qLrTZ95iQXS25sgseU4o84df9SRvwuVdHDY5CTG2qMR
	Hs0DLOjiN92S/3UJbK5ASS3rIzZOutyyNYBZJfBw2Zc0wLjJrYByEAiwUz0RlQ+leyQgiN75QDD
	pXmyb5Pk7gPgwDJegu/LuiLORL3gkJPcT5Zi9iCj4Y3PKEV+fMddN5F556xyDgr79hoTxRelqNN
	p/U0PcBEdxuO8NFKBsaQF3Kxx/V/qsF1okUBYghDoK79Rp/s+aZHtmGtYvZ5b736aKb02PEcMGS
	49UF9706C+njCsCEYyTRSLThQsyILVwP4M6yQGjT53+8WAXZ8V9JIWwdy4S+4gfgl9aW/Ni7jmO
	K8RnvrGAp0fRKJ
X-Received: by 2002:a05:600c:4853:b0:492:2fc8:21f2 with SMTP id 5b1f17b1804b1-493e1012c27mr11908685e9.8.1783415493847;
        Tue, 07 Jul 2026 02:11:33 -0700 (PDT)
X-Received: by 2002:a05:600c:4853:b0:492:2fc8:21f2 with SMTP id 5b1f17b1804b1-493e1012c27mr11908505e9.8.1783415493425;
        Tue, 07 Jul 2026 02:11:33 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm32340161f8f.27.2026.07.07.02.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 02:11:32 -0700 (PDT)
Message-ID: <0b75cedb-691f-44ca-891c-d42d5cd24fd2@redhat.com>
Date: Tue, 7 Jul 2026 11:11:31 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] ax88179_178a: Add HW support for AX179A-based chips
To: Birger Koblitz <mail@birger-koblitz.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260701-ax88179a-v1-0-13685df67515@birger-koblitz.de>
 <20260701-ax88179a-v1-2-13685df67515@birger-koblitz.de>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260701-ax88179a-v1-2-13685df67515@birger-koblitz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/1/26 7:42 AM, Birger Koblitz wrote:
>  static int ax88179_reset(struct usbnet *dev)
>  {
> -	u8 buf[5];
> -	u16 *tmp16;
> -	u8 *tmp;
>  	struct ax88179_data *ax179_data = dev->driver_priv;
>  	struct ethtool_keee eee_data;
> +	u16 *tmp16;
> +	u8 buf[5];
> +	u8 *tmp;
>  
>  	tmp16 = (u16 *)buf;
>  	tmp = (u8 *)buf;
>  
>  	/* Power up ethernet PHY */
> -	*tmp16 = 0;
> -	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PHYPWR_RSTCTL, 2, 2, tmp16);
> +	if (ax179_data->chip_version < AX_VERSION_AX88179A) {
> +		*tmp16 = 0;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PHYPWR_RSTCTL, 2, 2, tmp16);
>  
> -	*tmp16 = AX_PHYPWR_RSTCTL_IPRL;
> -	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PHYPWR_RSTCTL, 2, 2, tmp16);
> -	msleep(500);
> +		*tmp16 = AX_PHYPWR_RSTCTL_IPRL;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PHYPWR_RSTCTL, 2, 2, tmp16);
> +		msleep(500);
>  
> -	*tmp = AX_CLK_SELECT_ACS | AX_CLK_SELECT_BCS;
> -	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_CLK_SELECT, 1, 1, tmp);
> -	msleep(200);
> +		*tmp = AX_CLK_SELECT_ACS | AX_CLK_SELECT_BCS;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_CLK_SELECT, 1, 1, tmp);
> +		msleep(200);
> +	} else {
> +		*tmp = AX_PHY_POWER;
> +		ax88179_write_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, tmp);
> +		msleep(250);
> +	}
> +
> +	if (ax179_data->chip_version == AX_VERSION_AX88279) {
> +		*tmp16 = ax88179_mdio_read(dev->net, dev->mii.phy_id, MII_ADVERTISE);
> +		*tmp16 &= ~(ADVERTISE_10FULL | ADVERTISE_10HALF);
> +		*tmp16 |= ADVERTISE_RESV; /* Advertise 2.5GBit link */
> +		ax88179_mdio_write(dev->net, dev->mii.phy_id, MII_ADVERTISE, *tmp16);
> +	}
>  
>  	/* Ethernet PHY Auto Detach*/
>  	ax88179_auto_detach(dev);
>  
> +	if (ax179_data->chip_version >= AX_VERSION_AX88179A) {
> +		*tmp = AX_MAC_EFF_EN;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_MAC_BULK_OUT_CTRL, 1, 1, tmp);
> +
> +		*tmp16 = 0;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, 2, tmp16);
> +
> +		*tmp = 0x04;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_LOW, 1, 1, tmp);
> +		*tmp = 0x10;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_HIGH, 1, 1, tmp);
> +
> +		*tmp = 0;
> +		if (dev->net->features & NETIF_F_HW_VLAN_CTAG_FILTER)
> +			*tmp |= AX_VLAN_CONTROL_VFE;

Does not build successfully:

../drivers/net/usb/ax88179_178a.c: In function ‘ax88179_reset’:
../drivers/net/usb/ax88179_178a.c:2376:33: error: ‘AX_VLAN_CONTROL_VFE’
undeclared (first use in this function)
 2376 |                         *tmp |= AX_VLAN_CONTROL_VFE;

Full log here:

https://netdev-ctrl.bots.linux.dev/logs/build/1119419/14655119/build_32bit/stderr

Side process note: the patch series shoudl include the target tree
('net-next' in this case).

/P


> +		if (dev->net->features & NETIF_F_HW_VLAN_CTAG_RX)
> +			*tmp |= AX_VLAN_CONTROL_VSO;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, tmp);
> +
> +		*tmp = 0xff;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_MAC_BM_INT_MASK, 1, 1, tmp);
> +
> +		*tmp = 0;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_MAC_BM_RX_DMA_CTL, 1, 1, tmp);
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_MAC_BM_TX_DMA_CTL, 1, 1, tmp);
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_MAC_ARC_CTRL, 1, 1, tmp);
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_MAC_SWP_CTRL, 1, 1, tmp);
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_MAC_TX_HDR_CKSUM, 1, 1, tmp);
> +	}
> +
>  	/* Read MAC address from DTB or asix chip */
>  	ax88179_get_mac_addr(dev);
>  	memcpy(dev->net->perm_addr, dev->net->dev_addr, ETH_ALEN);
>  
>  	/* RX bulk configuration */
> -	memcpy(tmp, &AX88179_BULKIN_SIZE[0], 5);
> -	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RX_BULKIN_QCTRL, 5, 5, tmp);
> -
> -	dev->rx_urb_size = 1024 * 20;
> -
> -	*tmp = 0x34;
> -	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_HIGH, 1, 1, tmp);
> -
> -	*tmp = 0x52;
> -	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_LOW, 1, 1, tmp);
> +	if (ax179_data->chip_version < AX_VERSION_AX88179A) {
> +		memcpy(tmp, &AX88179_BULKIN_SIZE[0], 5);
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RX_BULKIN_QCTRL, 5, 5, tmp);
> +		*tmp = 0x34;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_LOW, 1, 1, tmp);
> +
> +		*tmp = 0x52;
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_PAUSE_WATERLVL_HIGH,
> +				  1, 1, tmp);
> +		dev->rx_urb_size = 1024 * 20;
> +	} else {
> +		/* The Bulk-Register configuration for the AX88179A is done in
> +		 * ax88179a_link_reset(), once the link is up for a given link and USB-speed.
> +		 */
> +		if (ax179_data->is_ax88772d)
> +			dev->rx_urb_size = 1024 * 24;
> +		else
> +			dev->rx_urb_size = 1024 * 48;
> +	}
>  
>  	/* Enable checksum offload */
>  	*tmp = AX_RXCOE_IP | AX_RXCOE_TCP | AX_RXCOE_UDP |
>  	       AX_RXCOE_TCPV6 | AX_RXCOE_UDPV6;
>  	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RXCOE_CTL, 1, 1, tmp);
> +	ax179_data->rx_checksum = 1;
>  
>  	*tmp = AX_TXCOE_IP | AX_TXCOE_TCP | AX_TXCOE_UDP |
>  	       AX_TXCOE_TCPV6 | AX_TXCOE_UDPV6;
>  	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_TXCOE_CTL, 1, 1, tmp);
>  
>  	/* Configure RX control register => start operation */
> -	*tmp16 = AX_RX_CTL_DROPCRCERR | AX_RX_CTL_IPE | AX_RX_CTL_START |
> -		 AX_RX_CTL_AP | AX_RX_CTL_AMALL | AX_RX_CTL_AB;
> -	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, 2, tmp16);
> -
> -	*tmp = AX_MONITOR_MODE_PMETYPE | AX_MONITOR_MODE_PMEPOL |
> -	       AX_MONITOR_MODE_RWMP;
> +	ax179_data->rxctl = AX_RX_CTL_DROPCRCERR | AX_RX_CTL_START |
> +			    AX_RX_CTL_AP | AX_RX_CTL_AMALL | AX_RX_CTL_AB;
> +	if (ax179_data->ip_align)
> +		ax179_data->rxctl |= AX_RX_CTL_IPE;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, 2, &ax179_data->rxctl);
> +
> +	if (ax179_data->chip_version < AX_VERSION_AX88179A)
> +		*tmp = AX_MONITOR_MODE_PMETYPE | AX_MONITOR_MODE_PMEPOL | AX_MONITOR_MODE_RWMP;
> +	else
> +		*tmp = AX_MONITOR_MODE_RWMP;
>  	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MONITOR_MOD, 1, 1, tmp);
>  
>  	/* Configure default medium type => giga */
>  	*tmp16 = AX_MEDIUM_RECEIVE_EN | AX_MEDIUM_TXFLOW_CTRLEN |
> -		 AX_MEDIUM_RXFLOW_CTRLEN | AX_MEDIUM_FULL_DUPLEX |
> -		 AX_MEDIUM_GIGAMODE;
> -	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> -			  2, 2, tmp16);
> +		 AX_MEDIUM_RXFLOW_CTRLEN | AX_MEDIUM_FULL_DUPLEX;
> +	if (!ax179_data->is_ax88772d)
> +		*tmp16 |= AX_MEDIUM_GIGAMODE;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, tmp16);
>  
>  	/* Check if WoL is supported */
>  	ax179_data->wol_supported = 0;
> @@ -1653,7 +2450,11 @@ static int ax88179_reset(struct usbnet *dev)
>  			     1, 1, &tmp) > 0)
>  		ax179_data->wol_supported = WAKE_MAGIC | WAKE_PHY;
>  
> -	ax88179_led_setting(dev);
> +	/* For chips starting with AX88179A, LEDS are configured by the adapter
> +	 * firmware directly from EEPROM/EFUSE values
> +	 */
> +	if (ax179_data->chip_version < AX_VERSION_AX88179A)
> +		ax88179_led_setting(dev);
>  
>  	ax179_data->eee_enabled = 0;
>  	ax179_data->eee_active = 0;
> @@ -1706,6 +2507,24 @@ static int ax88179_stop(struct usbnet *dev)
>  	return 0;
>  }
>  
> +static int ax88179a_stop(struct usbnet *dev)
> +{
> +	u16 reg16;
> +	u8 reg8;
> +
> +	ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &reg16);
> +	reg16 &= ~AX_MEDIUM_RECEIVE_EN;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &reg16);
> +
> +	reg16 = 0;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, 2, &reg16);
> +
> +	reg8 = 0;
> +	ax88179_read_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, &reg8);
> +
> +	return 0;
> +}
> +
>  static const struct driver_info ax88179_info = {
>  	.description = "ASIX AX88179 USB 3.0 Gigabit Ethernet",
>  	.bind = ax88179_bind,
> @@ -1732,6 +2551,45 @@ static const struct driver_info ax88178a_info = {
>  	.tx_fixup = ax88179_tx_fixup,
>  };
>  
> +static const struct driver_info ax88179a_info = {
> +	.description = "ASIX AX88179A USB 3.2 Gigabit Ethernet",
> +	.bind = ax88179a_bind,
> +	.unbind = ax88179a_unbind,
> +	.status = ax88179_status,
> +	.link_reset = ax88179a_link_reset,
> +	.reset = ax88179_reset,
> +	.stop = ax88179a_stop,
> +	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET | FLAG_AVOID_UNLINK_URBS,
> +	.rx_fixup = ax88179a_rx_fixup,
> +	.tx_fixup = ax88179a_tx_fixup,
> +};
> +
> +static const struct driver_info ax88772d_info = {
> +	.description = "ASIX AX88772D/E USB 2.0 Fast Ethernet",
> +	.bind = ax88179a_bind,
> +	.unbind = ax88179a_unbind,
> +	.status = ax88179_status,
> +	.link_reset = ax88179a_link_reset,
> +	.reset = ax88179_reset,
> +	.stop = ax88179a_stop,
> +	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET | FLAG_AVOID_UNLINK_URBS,
> +	.rx_fixup = ax88179a_rx_fixup,
> +	.tx_fixup = ax88179a_tx_fixup,
> +};
> +
> +static const struct driver_info ax88279_info = {
> +	.description = "ASIX AX88279 USB 3.2 2.5Gigabit Ethernet",
> +	.bind = ax88179a_bind,
> +	.unbind = ax88179a_unbind,
> +	.status = ax88179_status,
> +	.link_reset = ax88179a_link_reset,
> +	.reset = ax88179_reset,
> +	.stop = ax88179a_stop,
> +	.flags = FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PACKET | FLAG_AVOID_UNLINK_URBS,
> +	.rx_fixup = ax88179a_rx_fixup,
> +	.tx_fixup = ax88179a_tx_fixup,
> +};
> +
>  static const struct driver_info cypress_GX3_info = {
>  	.description = "Cypress GX3 SuperSpeed to Gigabit Ethernet Controller",
>  	.bind = ax88179_bind,
> @@ -1877,6 +2735,18 @@ static const struct driver_info at_umc2000sp_info = {
>  
>  static const struct usb_device_id products[] = {
>  {
> +	/* ASIX AX88179A/B USB 3.2 Gigabit Ethernet */
> +	USB_DEVICE_VER(0x0b95, 0x1790, 0x0200, 0x0200),
> +	.driver_info = (unsigned long)&ax88179a_info,
> +}, {
> +	/* ASIX AX88772D USB 2.0 100Mbit Ethernet */
> +	USB_DEVICE_VER(0x0b95, 0x1790, 0x0300, 0x0300),
> +	.driver_info = (unsigned long)&ax88772d_info,
> +}, {
> +	/* ASIX AX88279 USB 3.2 2.5GBit Ethernet */
> +	USB_DEVICE_VER(0x0b95, 0x1790, 0x0400, 0x0400),
> +	.driver_info = (unsigned long)&ax88279_info,
> +}, {
>  	/* ASIX AX88179 10/100/1000 */
>  	USB_DEVICE_AND_INTERFACE_INFO(0x0b95, 0x1790, 0xff, 0xff, 0),
>  	.driver_info = (unsigned long)&ax88179_info,
> 

