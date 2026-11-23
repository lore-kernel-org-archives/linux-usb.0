Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433024;
	b=j4K7v2pxqwLTnNC4yIADMs29mnjeurKS5CLcx1Iw3riEgVf8ipwMc24f5A5m9VgJT0x6
	 150OCyLXd1pKZy9BB4jdV02K2//zUspQGxgwHX8zlGg1Jch1+mBaJdWDGIdeTcuV36hwG
	 cflyhcDiFqHcptFL+BnuQxwiuSXaESpVFY5yz5bYOdvuBR+Il5trJnhZESk1VBGDONXHP
	 vsx2hk2x70u6/0eG2J3P01wYzM8ntUgaszyyVUcvps3mmvzZr+L24maALs5v3P6ld8n0r
	 dmaoRNAA22a+gfEcGwT0kdBp6MNstMTuR1dbo9xHXCjsFiUJ6WmW4qNOixQewQG3dCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CZXaupFApMYyaG0ZLY+up9G5E6yimD7cHLisYYOXKXQ=;
	b=YvMLTK2FuBzseG/qh4euEXuPGesy4zDPFTwX5ZvMPuny8RFrgEh3iXVEX0uzhifI9jAj
	 ne0IMCBPMAEEyme85YE9sva/0N/J3m+51CLP7w8y2BJlVGFUCnCxz/VXq7a5lbs/MwAKG
	 sbrd25PXCyRt3ckeYoR/OjxlhqAQG8GmbLp4ahz+CtxAcHOVxT8NDtDjOHUwaf+oMwIm2
	 Uf/V+t98f9eN76pdgsuyMOsL0bViKBL4PwwEtTjUqCTpsKshnKlEyrF2kc593ZoPA8sUK
	 xiTcbpD8mAbb8YH/JwDTvXw/EbscmDUu4vaiSWkLB2PT6E4F2ylVlzuZNLIqZ6r3UbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JltZZlhl;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B263606A327
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 11:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B263606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JltZZlhl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so27305625e9.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 03:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433022; x=1796037822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZXaupFApMYyaG0ZLY+up9G5E6yimD7cHLisYYOXKXQ=;
        b=JltZZlhl7ldUDx/+RKzkJYpJCyAgANA1yKarLA7NN4EXlJK1tn2MScxpxYreyPKp+e
         pmZHFF8mag7GyjI/4lDz9piGR2z642p+6t0VCRcVRBCj2a9FXqO+CwkYU9tImh4Mbb0U
         llaUrxiQe4xutUDndQpcJIFnwWlgdk6sumZ6RP9yXBE1Vd/9GvVhMZ6lRuGZSrtHrwqw
         JvHte+29YCHSbCaDWD7djHCusUVBslKOP3NBIM+MRVAPaXfHN+rY/I6rZLdf/FBih7SZ
         vAV6P/T/YwCXsxAEWEMdeAz9ARU6cLSD5RKoBoLDwHU31UrwSETa6bwRzeSgSskxXXtd
         ESkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433022; x=1796037822;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZXaupFApMYyaG0ZLY+up9G5E6yimD7cHLisYYOXKXQ=;
        b=L7QeRHu4vhCicgZBiZBccdT3DO24AZ2ywJD2TQBw71gT+gY2C51Sb0RXyDXv2Q/5m0
         Q5r3hZO6/rz15OPLEQtqiTqwfSt3xFKamgsDEVSoTdQ1kuilX0QTKNwXvh4QAzZvMABd
         mNw5Yt+eBIguP+YIqzqqtxA4u9rcouSIUFbJobHPxeK6XeWiDfk9lCa2zhdGXEU7qzzm
         LpcGDS+GL9+9yMEYOLDNXXxpFE10SgPAPvX1lt1wsrA7z71RWLfEiU3Rhb9LAipvpz46
         cOH/kXToWlxeUhXmL2Exm574Lvt05SVoZGUmrUSnvFqYPs3OWhOPvuUs8ow0haL4B3DQ
         WfsQ==
X-Forwarded-Encrypted: i=1; AL+hErGpqxewOM4V8knT2hPF+PYNynSyrzB1PsTzxaLjcKQLvHckNURtkKcdBqt2N6aBV5jbYbR7PPkMlvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z939AGwm3d7UmHJDeXDuDDP9VQTn+cZfq3TW+TuNZqyg7KJ+giE
	s/ScJnFW40i2j9PZl70X4lSbH/y5llnr4ZdBPHdv/kH4BOfl4N+pQWYI
X-Gm-Gg: AZFdTZf5hweCHNXmRTdgJsGWLbcdtAmH/89DQrthXMBMyP7ApaX0i3PMIX+p8xHiWyB
	R0bJDKJ2JkfAqLRmRGryIx5Pne/pFM4PFbxovBX1gkfa2NbOQcWlOS8GQokic3SigVmUiKaMZxS
	D5fNRhPuhjuBSs2gqHCbUdav+R3P//i7PQ+gLo1qlX1KjZkAFzcU2a9bGzWAjAJrx5iWZt9oBwz
	QSulz5KMKyFD/BAYkFmYuNw/RdKETUS015NAqqyPV93cV6pVQmseqQbNKbDr8Kdj6x84ARqwDFp
	t+R+yc8oA519xknRvugJ3TdBkQvGp1IB50wdaC4eiqBJtpEt5YLihFRzxj21Jxv9wS6pAXbE3vJ
	PgSY6riJ4Uv0dI8VeE9jkQOwel1eGA08diFWVdfQBiFYgeCAsmpYFZoP671wecXO31jrdqrHUC/
	PBCRnhV9aM9m2cSJELqq0P7rRHVOd1dKKEke7OVy6u2pKgNmIe2L++goUqB3vV4uoA1nD7OhYRO
	soYL3FzG1kF2vCE/vmq04zfIDCiuZQY1hszcYPHeATi54hcqCy4Y+SpJmgIM7WJI8axztxIjVdi
	y0rVcw/zdbJr78+yBNZ7jq9hGk0Sk4nI542GDH79
X-Received: by 2002:a05:600c:820d:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb887c2ca3mr240154335e9.4.1795433021711;
        Mon, 23 Nov 2026 03:23:41 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm24419628f8f.24.2026.11.23.03.23.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 23 Nov 2026 03:23:41 -0800 (PST)
Date: Mon, 23 Nov 2026 12:23:43 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Kuangyi Chiang <ki.chiang65@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] xhci: Handle missing USB2 resume events on Etron
 hosts
Message-ID: <20261123122343.6d3f8866.michal.pecio@gmail.com>
In-Reply-To: <20261123072320.5967-1-ki.chiang65@gmail.com>
References: <20261123072320.5967-1-ki.chiang65@gmail.com>
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

On Mon, 23 Nov 2026 15:23:20 +0800, Kuangyi Chiang wrote:
> On Etron xHCs, a USB2 remote wakeup may also move other suspended
> USB2 ports into the resume state without generating individual Port
> Status Change Events.
> 
> The issue can be reproduced as follows:
> 
> 1. Connect a USB2 hub to each downstream port of the Etron xHC.
> 2. Wait for all hubs, including the root hub, to autosuspend.
> 3. Connect a USB device, such as a mouse, to each USB2 hub in turn.
> 4. The last connected mouse does not work.
> 
> The affected USB2 ports may remain in the resume state, preventing
> newly connected devices from enumerating. Reconnecting an affected
> hub or mouse does not help. Reloading the xHCI driver restores
> normal operation.
> 
> When handling a USB2 resume event on an Etron xHC, check the other
> USB2 ports for the resume state and track them so the normal resume
> handling can complete.
> 
> Before the patch, the root hub status bitmap reported only port 2
> (evt 0004), leaving port 3 in the resume state.
> 
> [ 4621.396100] xhci_hcd 0000:01:00.0: Port change event, 3-2, id 2, portsc: 0x400fe3
> [ 4621.396158] xhci_hcd 0000:01:00.0: port resume event for port 2
> [ 4621.396164] xhci_hcd 0000:01:00.0: resume HS port 2
> [ 4621.437164] hub 3-0:1.0: state 7 ports 4 chg 0000 evt 0004
> [ 4621.569169] usb usb3-port2: resume, status 0
> 
> After the patch, the bitmap includes both ports (evt 000c), allowing
> port 3 to complete resume through the normal resume handling.
> 
> [ 4824.829350] xhci_hcd 0000:01:00.0: Port change event, 3-2, id 2, portsc: 0x400fe3
> [ 4824.829425] xhci_hcd 0000:01:00.0: port resume event for port 2
> [ 4824.829431] xhci_hcd 0000:01:00.0: resume HS port 2
> [ 4824.829439] xhci_hcd 0000:01:00.0: HS port 3 in resume without event, portsc: 0xfe3
> [ 4824.870180] hub 3-0:1.0: state 7 ports 4 chg 0000 evt 000c
> [ 4825.001183] usb usb3-port2: resume, status 0
> [ 4825.027484] usb usb3-port3: resume, status 0
> 
> Tested on Etron EJ168 (1b6f:7023) and EJ188 (1b6f:7052).
> 
> Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>

Hi,

This repro doesn't seem to work for me.

Etron Technology, Inc. EJ168 USB 3.0 Host Controller [1b6f:7023] (rev 01)
/:  Bus 008.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/2p, 480M
    |__ Port 001: Dev 040, If 0, Class=Hub, Driver=hub/4p, 480M
    |__ Port 002: Dev 034, If 0, Class=Hub, Driver=hub/4p, 480M

# connecting a mouse to hub 2 resumes the bus:
[ 8316.191894] xhci_hcd 0000:07:00.0: Port change event, 8-2, id 2, portsc: 0xc400fe3
[ 8316.191911] xhci_hcd 0000:07:00.0: resume root hub
[ 8316.191930] xhci_hcd 0000:07:00.0: port resume event for port 2
[ 8316.191936] xhci_hcd 0000:07:00.0: resume HS port 2
[ 8316.191992] usb usb8: usb wakeup-resume
[ 8316.192001] usb usb8: usb auto-resume
[ 8316.192015] hub 8-0:1.0: hub_resume

# core polls both RH ports for status, both are resuming:
[ 8316.192030] xhci_hcd 0000:07:00.0: Get port status 8-1 read: 0xfe3, return 0x507
[ 8316.192059] usb usb8-port1: status 0507 change 0000
[ 8316.192069] xhci_hcd 0000:07:00.0: Get port status 8-2 read: 0xfe3, return 0x507
[ 8316.192079] usb usb8-port2: status 0507 change 0000
[ 8316.192094] hub 8-0:1.0: state 7 ports 2 chg 0000 evt 0000
[ 8316.232936] hub 8-0:1.0: state 7 ports 2 chg 0000 evt 0006

# hub 1 is resumend, inspected and suspended again
[ 8316.232961] xhci_hcd 0000:07:00.0: resume USB2 port 8-1
[ 8316.232970] xhci_hcd 0000:07:00.0: Set port 8-1 link state, portsc: 0xfe3, write 0x10e01
[ 8316.233017] xhci_hcd 0000:07:00.0: Port change event, 8-1, id 1, portsc: 0x400e03
[ 8316.233041] xhci_hcd 0000:07:00.0: Get port status 8-1 read: 0xfe3, return 0x40503
[ 8316.233061] xhci_hcd 0000:07:00.0: clear port1 suspend/resume change, portsc: 0xe03
[ 8316.244881] usb 8-1: usb wakeup-resume
[ 8316.244921] xhci_hcd 0000:07:00.0: Get port status 8-1 read: 0xe03, return 0x503
[ 8316.256001] usb 8-1: Waited 0ms for CONNECT
[ 8316.256014] usb 8-1: finish resume
[ 8316.256917] hub 8-1:1.0: hub_resume
[ 8316.259088] usb usb8-port1: resume, status 0
[ 8316.259122] xhci_hcd 0000:07:00.0: resume USB2 port 8-2
[ 8316.259131] xhci_hcd 0000:07:00.0: Set port 8-2 link state, portsc: 0xfe3, write 0x10e01
[ 8316.259158] hub 8-1:1.0: state 7 ports 4 chg 0000 evt 0000
[ 8316.259345] xhci_hcd 0000:07:00.0: Port change event, 8-2, id 2, portsc: 0x400e03
[ 8316.259410] xhci_hcd 0000:07:00.0: Get port status 8-2 read: 0xfe3, return 0x40503
[ 8316.259552] xhci_hcd 0000:07:00.0: clear port2 suspend/resume change, portsc: 0xe03
[ 8316.261302] hub 8-1:1.0: hub_suspend
[ 8316.262137] xhci_hcd 0000:07:00.0: Set port 8-1 link state, portsc: 0xe03, write 0x10e61

# hub 2 is resumend, inspected and the device enabled
[ 8316.270925] usb 8-2: usb wakeup-resume
[ 8316.270950] xhci_hcd 0000:07:00.0: Get port status 8-2 read: 0xe03, return 0x503
[ 8316.272785] usb 8-1: usb auto-suspend, wakeup 1
[ 8316.282855] usb 8-2: Waited 0ms for CONNECT
[ 8316.282867] usb 8-2: finish resume
[ 8316.283835] hub 8-2:1.0: hub_resume
[ 8316.284504] usb 8-2-port1: status 0301 change 0001
[ 8316.391951] usb usb8-port2: resume, status 0
[ 8316.391985] hub 8-2:1.0: state 7 ports 4 chg 0002 evt 0000
[ 8316.392650] usb 8-2-port1: status 0301, change 0000, 1.5 Mb/s
[ 8316.393099] usb 8-2-port1: indicator auto status 0
[ 8316.447829] xhci_hcd 0000:07:00.0: xhci_hub_status_data: stopping usb8 port polling
[ 8316.457913] usb 8-2.1: new low-speed USB device number 46 using xhci_hcd

# (not shown): hub 1 works normally, including wake on connection

Regards,
Michal
