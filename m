Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023129.outbound.protection.outlook.com [52.101.127.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6726F3914E4
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455150; cv=fail; b=qqsWCKJn62pUK2rxzPSlHJ6mdaRkmFW3OwNxlxHvu5n59REEGh//4XkogEw20hqCUhRwW9kGDHlTJjpKCed+6UcikrPXqKflK0G4MkKh3cIHv6ZD1uZxnf9RfnMl96ufBp6KdXrfixfbmxW+QDGgGoJZcGWUkbXVpFyIyONK5/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455150; c=relaxed/simple;
	bh=HpZT01we2JQa5Nvs25eSErm2DPtG9n3pvSjbaQ6JNIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j1NNWedcfu4CZN7TPp16gxMh/xGnAofoBqdutosf3qRcY0H3M4ct1ahNxQwpnBjJucRoDAqzUXE4xquKKCs6c9kJ2K88nveByBuWIVoTttIw/eE11t6GqYOTd6sRNkKk1F1cwbEgshrldoQjDxrLyltur/WwmE6ZY6Nq5KHDAOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com; spf=pass smtp.mailfrom=qnap.com; dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b=bS/fadql; arc=fail smtp.client-ip=52.101.127.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qnap.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qnap.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qnap.com header.i=@qnap.com header.b="bS/fadql"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSKRDmv6hh6NrGJOZUmB0LCJIqZSptOEzbPBQkfRZ/E+Pw92Nz0pWsYTFmnT17TiF3kAR4fbhpJqHc1nBt7VLFYBnt7u8O26rqVGeIA2CfmuKgbFDVJVqSQ+VVVThzRDRv6lVJDCqt1OU952PG/um8wW0jv22APxQnRcLwksm/h/tlO4nxRMiXsqxbT36Isk6b4/R0mG2iK37HXd9TgQ3ksOgQgiOgb+q2enEhivqwZ1L/CjTKxTWMumOOTpSqSkGWR5oRJ1Bu00kL5ElYLT1ttpLGX/19hW/mdC8Mxb2pfo8VAWgDk8tXIjn/ZYs602SJEnaOiBzeR3YXl5WvXZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZ1fhv8BIHqhyvgGWHOABb+Xa995xoJVm/vcsVk8Ijs=;
 b=PsQ8ALcFG9UambaDWmNyvjMDQJyvqG+EpoYThznYhiPGqUYjXZI6PltK9MZdVTQJHcDuqXM1f+dF70qzKEYN2HoHh0OsceS6A/qAtYy5oHKLqT4RcIXfdFp+HZ4OZfsbdghrMNnNsA3VDAKTh8dT3TSlFiJj5h5oWXO9/eb6OQg0WA+5u8w4lRRk1Ie9WVPckqzzInVNrjaQlrcrjLvve6mllPur9zIqWh0I4ra/r/uL1p3NBp9jRDbgNbNecXVxrRPBUDz/vJHYfqbjlRoCri0TUS6Daj9ypScPjIsfARdH/HMjgbmCE+QcvViXPirSiW2znEEa+37OqEk+DlquTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 122.147.219.42) smtp.rcpttodomain=gmail.com smtp.mailfrom=qnap.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=qnap.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZ1fhv8BIHqhyvgGWHOABb+Xa995xoJVm/vcsVk8Ijs=;
 b=bS/fadqlwQgs3deyGtHOV1KmVni3uBFFaS31w//587xEnv8Zi4lammEcBRwhTKCs8KkzgKDyZ0YQJUVY8145SHAgS+nTQCNnnTW8Q9SvUcB72iO6b21MuHEOovnqN+kTtHwGAabAttikKfqCugrpzCwr5n+CSZ/fTMCpxXb1OkeEaEXcbG6MYe8k/rpFN7F5f4DYmP7ytG7hFteQXL+7DD+KOsA0puXR1WmH37YHocS1ucX+9BdM6rzJeH1d1IUlnXZHy5VD9ocevUOBzBmsYar4lfjyW1vZm65/opuaNsjlMzqhWWN7Jwe+NWFkWnVP54DeXHxEv2viqHypWYKvgQ==
Received: from SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) by KL1PR0401MB6281.apcprd04.prod.outlook.com
 (2603:1096:820:bd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 10:25:41 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::2d) by SI2PR01CA0047.outlook.office365.com
 (2603:1096:4:193::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 8
 Oct 2026 10:25:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 122.147.219.42) smtp.mailfrom=qnap.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=qnap.com;
Received-SPF: Fail (protection.outlook.com: domain of qnap.com does not
 designate 122.147.219.42 as permitted sender)
 receiver=protection.outlook.com; client-ip=122.147.219.42;
 helo=mail19.qnap.com;
Received: from mail19.qnap.com (122.147.219.42) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.14
 via Frontend Transport; Thu, 8 Oct 2026 10:25:41 +0000
Received: from localhost (unknown [172.17.22.73])
	by mail19.qnap.com (Postfix) with ESMTP id D957E4B;
	Thu,  8 Oct 2026 18:25:40 +0800 (CST)
From: Henry Tseng <henrytseng@qnap.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Henry Tseng <henrytseng@qnap.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] xhci: handshake timeout overrun and configure endpoint hang on device disconnect
Date: Thu,  8 Oct 2026 18:25:20 +0800
Message-ID: <20261008102522.109308-1-henrytseng@qnap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008110642.56567a92.michal.pecio@gmail.com>
References: <20260930101752.15794-1-henrytseng@qnap.com> <20261002113012.271ceead.michal.pecio@gmail.com> <179136673328.386669.9410030239460428155@qnap.com> <20261008110642.56567a92.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|KL1PR0401MB6281:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 93fa6446-2624-4139-8c7f-08df25268111
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|6133799003|18002099003|22082099003|55112099003|10067099003|3023799007|4143699003|11063799006|260925021911599003|260925022911599003|260925021311599003|56012099006;
X-Microsoft-Antispam-Message-Info:
	178UFIBgjrlkO2X/7BeYDKb9t3QzmFyT/yzb6FYHG5G+RmpVXYcBf/WnhDkZGnMoZ3K+fyKjiZYQDapB/TXoDtii2pGWiRsQ0+Eo3dOl0AYSPUc9Vbdw4WNcedUB3wUeG5e1fgwwb0XtcAljMWUC1ZKcQO281u+XWCN23HrkqUXO+A/etGssXgojWTMxldNhQluOVHIjDaJQ6rPGn6NO8He2iFpMiqXAXtTXXf5w/trxqPgEzJgqUB1pYHPM4TejvAfLfmbjOnUQpWPfr9xeCKl1jbj1TMvoA1RIUTZV7ye8kRxd+UyRC2ToTEn2h2lH/bHyp20HTS4U4FQOXg5iUmjBG4gp1AEpwzIehdZvMUaNPy/2+aET+mNK2p0r64ah5PLZ9mpVVFui17FBOU7eGUI+ySs8FiW78ttWD2aWT0R8S9Wr68x+kqXteF+6wNcbIM+4Wv3efy99oS0dTzBhdd5dfKiWMgRnZe9HeSine63LJ3XbBsd5CLrgDVUx8Qb+8LYLtNHTm1LEYYrpSy0piWrWQ0qD8+XeOnUbk03B2Y+GiD1z9utIfWCuNiak0m+6lPza4R1yyBcy90Y80GC295QN3Ey7wn4hbzwKW1r/OpOxAIq+2f6az+fQs8/0ZLhnTf5ytwooG6HPn22AlOJCqr6URXEvBKcdQJc2vx1LftIIN7LV8p1WLPaodeGVc+LjPfMXjY/53ASLb8u7NSEY3Q==
X-Forefront-Antispam-Report:
	CIP:122.147.219.42;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail19.qnap.com;PTR:122-147-219-42.static.sparqnet.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(6133799003)(18002099003)(22082099003)(55112099003)(10067099003)(3023799007)(4143699003)(11063799006)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gs3wPhMfQ2T5PnvCKNHAcJnC9WL2Q+WzbMVwLPiZM8oOJuaFUEES+jzbt25cLfmrUf6JVxDiW3dkU92uUu7if/LxEN2+JUNlnUXjLgXx4qlzv6FFw2wRmNLbbYXFXw/wsmZOS2ItzkeYEvJEX3NH0E3f6pfn8yT9402oh2RBWx2SnXxL+XS6sCZxk/J3HtSyWE+oZiHB2oHt8qmNmZTmkoB97N2xj+f694cmdje2diGvSyFlel5/okv43Acc5B3y0X2EXHiGjU5p5+h74OA/iljkI7B+7HfLgPUWvY4Y3OwVDCJ9WVSqs1DMPjA3qaDGd0iFHYVPvJEPKi8k/xMFtzgbRO/NnP0/82dGzxOIEwf4FY2S98LoCaUSARIQjmkXC9ugpSj/UwSJ3tQsobVCupSPtnTRsAOjUJuuoSQ8MyaL23hjtE1An22+J9W+ut7j
X-OriginatorOrg: qnap.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:25:41.3063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93fa6446-2624-4139-8c7f-08df25268111
X-MS-Exchange-CrossTenant-Id: 6eba8807-6ef0-4e31-890c-a6ecfbb98568
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6eba8807-6ef0-4e31-890c-a6ecfbb98568;Ip=[122.147.219.42];Helo=[mail19.qnap.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6281

Hi Michal,

On Thu, 8 Oct 2026 11:06:42 +0200, Michal Pecio <michal.pecio@gmail.com> wrote:
> Can you identify the 2-1.3 device? Can it be separated or is all 
> this stuff inside one physical box?
> 

2-1.3 is a hub, 1c04:0018 "QNAP Systems, Inc. USB3.2 Hub". 2-1 and
2-1.4 have the same VID:PID. They are all inside the TL-D800C and
can't be separated.

/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
        ID 1c04:0018 QNAP System Inc.
        |__ Port 001: Dev 003, If 0, Class=Communications, Driver=cdc_acm, 12M
            ID 04d8:000a Microchip Technology, Inc. CDC RS-232 Emulation Demo
        |__ Port 001: Dev 003, If 1, Class=CDC Data, Driver=cdc_acm, 12M
            ID 04d8:000a Microchip Technology, Inc. CDC RS-232 Emulation Demo
        |__ Port 003: Dev 004, If 0, Class=Hub, Driver=hub/4p, 480M
            ID 1c04:0610 QNAP System Inc.
        |__ Port 004: Dev 005, If 0, Class=Hub, Driver=hub/4p, 480M
            ID 1c04:0610 QNAP System Inc.
/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 10000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 10000M
        ID 1c04:0018 QNAP System Inc.
        |__ Port 003: Dev 003, If 0, Class=Hub, Driver=hub/4p, 10000M
            ID 1c04:0018 QNAP System Inc.
        |__ Port 004: Dev 004, If 0, Class=Hub, Driver=hub/4p, 10000M
            ID 1c04:0018 QNAP System Inc.
            |__ Port 004: Dev 005, If 0, Class=Mass Storage, Driver=uas, 10000M
                ID 174c:55aa ASMedia Technology Inc. ASM1051E SATA 6Gb/s bridge, ASM1053E SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge, ASM1153E SATA 6Gb/s bridge

> Does it help to blacklist "uas" driver before connecting the whole
> tree? My guess at this point: probably not, it's not a streams bug.
> 

No, the host still dies.

> What happens if deconfigure manually before disconnection:
> 
>   echo 0 > /sys/bus/usb/devices/4-6/bConfigurationValue
> 
> Will it hang on deconfiguration, disconnection, or not at all?
> 

I used 2-1.3 as in your follow-up. The whole tree enumerates the same
way in every run. The logs in patch 2 were taken with an extra USB
stick on 2-2 of the same host, which shifted slot IDs by one, so 2-1.3
was slot 5 there and slot 4 here.

Deconfiguring 2-1.3 completes fine:

  [   87.929570] xhci_hcd 0000:0c:00.3: Cancel URB 0000000064a1e51d, dev 1.3, ep 0x83, starting at offset 0xfff49000
  [   87.929675] xhci_hcd 0000:0c:00.3: Stopped on Transfer TRB for slot 4 ep 6
  [   87.929756] xhci_hcd 0000:0c:00.3: Successful Set TR Deq Ptr cmd, deq = @fff49010
  [   87.930564] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 4, new drop flags = 0x80, new add flags = 0x0
  [   87.937756] xhci_hcd 0000:0c:00.3: Successful Endpoint Configure command

The host still dies on disconnection, but the stuck command is now the
configure endpoint dropping 0x83 of the 2-1.4 hub (slot 6):

  [  164.793408] usb 2-1: USB disconnect, device number 2
  [  164.793419] usb 2-1.3: USB disconnect, device number 3
  ...
  [  164.803390] usb 2-1.4: USB disconnect, device number 4
  ...
  [  164.834173] xhci_hcd 0000:0c:00.3: Cancel URB 000000009ac4b95a, dev 1.4, ep 0x83, starting at offset 0xfff15010
  [  164.834219] xhci_hcd 0000:0c:00.3: Stopped on Transfer TRB for slot 6 ep 6
  [  164.834819] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 6, new drop flags = 0x80, new add flags = 0x0
  [  170.058142] xhci_hcd 0000:0c:00.3: Command timeout, USBSTS: 0x00000010 PCD
  [  185.909602] xhci_hcd 0000:0c:00.3: Abort failed to stop command ring: -110
  [  185.921446] xhci_hcd 0000:0c:00.3: xHCI host controller not responding, assume dead

If 2-1 is deconfigured instead, the same command completes for all
three hubs (2-1.3, 2-1.4 and 2-1 on slots 4, 6 and 2) while still
connected, and the host survives the unplug:

  [  165.209890] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 4, new drop flags = 0x80, new add flags = 0x0
  [  165.210644] xhci_hcd 0000:0c:00.3: Successful Endpoint Configure command
  ...
  [  165.397383] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 6, new drop flags = 0x80, new add flags = 0x0
  [  165.402651] xhci_hcd 0000:0c:00.3: Successful Endpoint Configure command
  ...
  [  165.404152] xhci_hcd 0000:0c:00.3: drop ep 0x83, slot id 2, new drop flags = 0x80, new add flags = 0x0
  [  165.418650] xhci_hcd 0000:0c:00.3: Successful Endpoint Configure command
  ...
  [  173.245013] usb 2-1: USB disconnect, device number 2

So far this command has only hung when issued after the disconnect.

Thanks,
Henry
