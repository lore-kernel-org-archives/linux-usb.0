Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808842F3C10;
	Tue,  4 Aug 2026 23:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785885442; cv=fail; b=SIsn7rc0ak1v/XwUdqVWqovgkiNUNn+/ervms4f4KadG1+G6m4p/2vSLgiwK23k25p5ykSgMKRBjAglqFEFfCraVKSM381cEqA8cQS8uT0Uly+xNFjWoHjfvI3U3pqTRQHljn1BViPJWD+4e28EgztMXZuwZMhk4Es7LEJRx2wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785885442; c=relaxed/simple;
	bh=bhkab/QClueqGZ0c1mfhrWYnr7mpyh4iW4HPftTDkCw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CUF2GXWl/kypD3WvDYwWIsKJSznWDexRHYe/ASHat3T1OTDVTG0wKaIqOTwK3YJ5vCPX0msPu7euKcY0aSnAf/ujZE1n9RTGcjVq5HxVWoSPNGtlcdF5GnL+37HgGKkNGmIePtZFG9pu1Y7uPWYTnaahC7NGQp1zDjSrRJJ9NRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jMxNpbRT; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Uh1wcPpU; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cY8EFA54 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jMxNpbRT";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Uh1wcPpU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cY8EFA54"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JpdrS1068569;
	Tue, 4 Aug 2026 16:17:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=bhkab/QClueqGZ0c1mfhrWYnr7mpyh4iW4HPftTDkCw=; b=
	jMxNpbRTw309afGlcQ39afQvOc2P0NZxWGG1VcK//Sb9TdbqwPa0oaIIvF7Jl1Mn
	pGqmi2uWD4HYKXxsxOE0D8QJvrii4pf6QhIiq1DiE0UN9xdbyarDbGW7EHuPye26
	jCgUogYV2Y5kbLt6sqlIt7OOGwutPEc+8QEtmAzcvkfPHPNd5O/D1WwdjqcsUzX6
	KXwWD2/KuxKSA+5zxF9mwzUOFvSh6IElFWwkj2sL3VfAPu9S8Pgqi7eIF1EkfQ5D
	hRJkQPUjWlDn96Kr99wZws+kCn8lNqRgmB8uyp7B80zDi8OTS/KbxkGORW7yV+Jb
	KgSTK038vLI+4AEF8663qQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4fudg86qny-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 16:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785885435; bh=bhkab/QClueqGZ0c1mfhrWYnr7mpyh4iW4HPftTDkCw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Uh1wcPpUTIjN6JuMykYewc8YFtztt54fz9WpgS6Ey4uKwR1GLOpo7xxJ4PttrxAnq
	 +TqZaQiIsveMrIXpVcp8sWXznE9KR7TK3cAgCw8g6oUZaKBcCyvtFSTXJqoJOhIxsQ
	 oaN+iA+UKRXRDOJTTZ6qySbE6qX1OjYJ5MFkxyYAlodKwwMcFOMNYB00hmrEW5oxYX
	 gVk5YSOYdIEEUYauHTR7rCo5Uzenr5fe1C8XBL/lDPDAE+oZMifA/amay91dWVcf15
	 SaRsDkwtK7I1sE/bI+5RQYZ8UZX1JaaaGNF9ODvl47uMO7Zpofh6kcym3saP2gHl/I
	 lBj6Q+HHAxuZA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1CB8B401AA;
	Tue,  4 Aug 2026 23:17:15 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B9968A0DD1;
	Tue,  4 Aug 2026 23:17:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=cY8EFA54;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00102.outbound.protection.outlook.com [40.93.6.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 17A66402D4;
	Tue,  4 Aug 2026 23:17:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPNbWaGW7ZVery51Cqw8TSHUnou0aoHOJEE+Bjt0DPLtXuWWEmmp4U7mAAITLdA2pSKeqCOSkUVbECjht+nKyYjEpI3J0ABIm74nQWDCckB3cDF9l00j5g9o2CNnuZ207gbX0nVHZy2UcH0tJKPzjhugMj+vFTuaRBMx2Medn0Lh2zOVoIeDIiI5FP6+lKsjsnbpXOtqsZczm42J2vr+EgrK9CBdNJXhICYGPXasLFo5B/HvTPI+WLFtB3KNwhekosNskHZQVATIpfDiBoS4hYVaBwBZ2Zy/WrRuVRsvyuSf4TmZdvJSXdy78WebCUsSs594iLxaVwpfYHehjVlZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhkab/QClueqGZ0c1mfhrWYnr7mpyh4iW4HPftTDkCw=;
 b=xoK8Jfakk8H7AhtIiOdjNfdnNiHrxLjuIyFwlAnLb6L47v/Vfykfv8pvLayUte8d2L8JDbx/MwL5Vr/6ZC/dA3FDCt0vdAh1e8kAmU0VkW7QPg4mFLsZvulEpZWz0KzpWaJeaRwEOlQ/hUH719GN7LA87HHP1VZTqPjqDGh3AMvyhM9bjh+aWD/35naHil9pSPrfTaM9MTW7ihqrMaUvjvmOf2pIvR+WSbRcg84KVayBvLtdyWwiOY8s8UJ55hH609sECpJ3hJYXNnp17vZpr2v5Uo9DttPPduODBAqyNGnZJ6pUz6ZtwUvUJMsCbC5aYOsa3skRpZN2aTvrjnFn+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhkab/QClueqGZ0c1mfhrWYnr7mpyh4iW4HPftTDkCw=;
 b=cY8EFA541N66C/nT6L+WnQBSK2+gHBQtqvVnf3FW4NVgnAEl7kygfZUSlepdcvF8TS49Y8j/bW1ncZyJtY9M4wmeJVydOwUGpjlMaOvwnx8CoZphQKj4fG5uM5jtW5x2U6gK6TCmt/PU936o9TCBm2XXnevVe4yoPFjYEcGtX7Y=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by LV2PR12MB5918.namprd12.prod.outlook.com (2603:10b6:408:174::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 23:17:08 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 23:17:08 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Jiazi Liu <jiazi.liu1984@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiazi Liu <liujiazi@amazon.com>
Subject: Re: [PATCH 1/1] usb: dwc3: ep0: skip CLEAR_HALT on non-stalled
 endpoints
Thread-Topic: [PATCH 1/1] usb: dwc3: ep0: skip CLEAR_HALT on non-stalled
 endpoints
Thread-Index: AQHdHa6BJQ9iHKne30O31Wtn2LvZ3baOk1+A
Date: Tue, 4 Aug 2026 23:17:08 +0000
Message-ID: <anJxm7K1F48Ba4H-@vbox>
References: <20260727095827.11807-1-liujiazi@amazon.com>
In-Reply-To: <20260727095827.11807-1-liujiazi@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|LV2PR12MB5918:EE_
x-ms-office365-filtering-correlation-id: 17910d35-b080-4a63-4511-08def27e8176
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|56012099006|11063799006|38070700021|6133799003|10067099003;
x-microsoft-antispam-message-info:
 1n56oC+40l0cOOAyoDjMGPTKdsDiEhMfOssJCYFiP0ICiaiWYI2splRYMox7fTn3F1HreRZjQxcEfwvvMkMW9HJVnhTGyQN3i9FAeJy6NbSH0UGNCS+0xUPl/P40nXp1us7GuS+l7laWYHiLfVYiiKTUJOqnEBdBlnEp464J5Fgq9QvNuUEnJdPMhCyDvWBegbRV4sSEb+la3C5/9lu1rQtnQbZ4kRoQEs6p3GThd784B1tt78fBsPDYiMxFqmFhYQ+z4IKopEAeXlUAymshtA4YA7eTSbKSH8Blm/trvG2wgLkG8SLmFPIOKY0FhXTUKLvpILZ+qxx3DwgPBF2YwhY+nMuoZ6VWbxplRwvjv06QsdbcQFpDa2XHdTi8XRLsvGCgB0wzj3XdbkdeqPOBU27X4ujImTCwA3K3jncx6POieOFfJljkQ32A+FTODNI8QFy063mQUon8zYTn8fmcvRrISbkeUMnel53KpDbh5DyNBu/f/+MYx1QTVQKAC3n3po6MaqgBa8rwHH5zlTyD3zuzb3cOLJzA7VJL69PUB6uZYbSLVyi1c0Y5nkeKYPY+Cm/azuMBdhc3s39jdDM7Yo8Ua0hhjYqUrciTzdUOdTqRXxHfyzvhiQ41yP5bnnrGpwuribvj2fDst+boa5Fk6k68NTN5yhmEaKqk1AUIm0KRW/Ac0JlHZffd/gRXfS+y7k51E7vKENUVeSPZlECaRpN8YPCmoDD5yiejgL+UeFU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021)(6133799003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cy9HUEY0YlB1SUxoMU81UHQwb2dSNGRVanRCVmtzdlRna3ZUQ1dBZXNvSWI4?=
 =?utf-8?B?Q0NYRnRTYWNxWllscy81dGllblQ3T1hHQmk1RmlWK0VCYXJZU0pjVTZnSzQ5?=
 =?utf-8?B?MDBwNGlIMU05NjEvZkdLSG9VQ2JuMVlNVHdBbGtoUnVkMnZpT3VWem9ETFlt?=
 =?utf-8?B?aHhMWEl5QldlelBydWxicStPZWFHTmVQczkrUEtNaFJBTVRmR2t0MmZpTDlT?=
 =?utf-8?B?U3RrbWFKVnJncFdndFJYNVZHampESUZuSWcrRHUvUUdpRjRQVi9RYitrWU5v?=
 =?utf-8?B?bGVyWGZZQTIzK0lpblZzMlJENnRnRG9oV2QrbEpZemo5aUdSU0ppS0U5VU1z?=
 =?utf-8?B?MWUvbHFOWGtzSjVUOVpkYjRiMS9TNXdxMkNBS2ZaOUw3YlhBNGtjR2p1Zjh4?=
 =?utf-8?B?L0hIN25UTXR2R2VUV2M4R0l1OTdrcFNYb28wSTNuUkRuN1IyWFZ5dUphdkor?=
 =?utf-8?B?VXUvckkvcXA3ZDd2c3NGRmh5QmRWTFR3cmJUS3JISC9EcUttb0FSTVU4VW5a?=
 =?utf-8?B?WlVqSHhWcFVYRWs0TldkZnNld1BMckxZblRHdTBUSDFhMFFsNGgzWDM5bWFH?=
 =?utf-8?B?RitWZFh4eW54aEJuOW42eGhXamIxSlRkbnJiOEN1SVZVeVpWS3IzVWYvN0J3?=
 =?utf-8?B?MWkweGtFczVrT2tZd2RqZlo5S1RnY0p0L0x1Y2hYVmk0RjdncnRWNVc3VkhO?=
 =?utf-8?B?d1NXK1crcjNvMUNlSktDMEUzalZvYjI3U0lYOFlLWm5JOWZwanlyQlNLWWl5?=
 =?utf-8?B?bHpnWnZLZkFZdzdvUGhJc2xUWTJqNnFxWDRIQTlOZG1QTHdTNENjMWxValhI?=
 =?utf-8?B?bnFtZlRVb1I5U3JDYnRMWVQ1RnlxUmM1dzZGZjkraVRrNVFyNDYwVUNiQ3BT?=
 =?utf-8?B?VS9TZjBocFlDOWgxUDJtVU03anYyZElaMVBDcGUwdXY2ZytXVkFIQ1YxWUlR?=
 =?utf-8?B?d0JmREJaa0theHhodFYzQ1M3YjEwVlViNnF1dEFIdmMxdlJ5VUwwZUpYVmY4?=
 =?utf-8?B?ZmpmYUFXS1l3a1N6MGVrcklvcGdWdFdtR29HK0xJT2crN1JrRE0yeFN4VGlz?=
 =?utf-8?B?dFRaZzl6TzgzRnZpUGF2UHR0Y2xqYmVlOEVzQlBMQXZMRmY5V01kaERwWEQ2?=
 =?utf-8?B?ZUFVejgvVGw1VENkMVhhWlZNNi94WWdXcFJVbjRwT3dEYkFRejI4UkFsdFBJ?=
 =?utf-8?B?ZVlqc2xnaTFyK2lKWmxrZ1ZTUVpTLytNKzJxTEFWMWNNbDVqenJINHdGZFBn?=
 =?utf-8?B?dUNpK1k3MHVxYWl3ODBQSDVQK3h0d2tCcG5sTC9kR2tSZjMzQTZMWlI4QXAy?=
 =?utf-8?B?ZStWU1FwTHIwUXZXb2d5Wk54VnRzUjNKSUY2T0JaR1lyaWdOTnVWT1JtZENr?=
 =?utf-8?B?dE52d1A5YXMzS2tEalVHVm03Uk9YU1hnOC83U1V0VTc5RWtMRFBKSjNBSmo1?=
 =?utf-8?B?bUFsRkV6M05RTkZrbVBramdtSDRuUVpxQTRZclZlUTJnelU2QjdtOG10M2s3?=
 =?utf-8?B?NkJPSFlCY0lBQU92TXdkUWdMZWU5WnhwN21xSXExdlozNXdOdHJjcW81WWwr?=
 =?utf-8?B?dWp2eWVMb1J6TVFzWUFZNjBlcHJ0RGMrWDh6TkJ0d0FMZnEyVVRZVHdqakZt?=
 =?utf-8?B?dmRCc0FiaUcvSC9pMmI3bHNzN0lvOFh2dDREaW9ObWg0bU9Oa2ZRalJobTdY?=
 =?utf-8?B?QlNNU0ZCQ1dockJuajhwQysvNG5wK29NYURnWkhQRFdCNEYrazNWYlhFNklt?=
 =?utf-8?B?YzMzUVI2SUhFbG5VQ3hrc0RDcVcxaDUwK1haTTdGTVErdUw3YXg0Rnl1S3RQ?=
 =?utf-8?B?S3ZBSEh3bFVSWW1kSDBnZTZrN2ZZMi9PbVFDZGVUZlUvbEdxbGhvRDAzajNN?=
 =?utf-8?B?cWpVeWpHUG5YSXhhMmdQVHgwMHZTbytOMnpHSmx1cGpwNlk3NUVRa2tGMG8v?=
 =?utf-8?B?YmtwbjNCUXBiQyswSW01SFNwZCtIVDBkTGdCWlhoaHA5dVRVNndZVmYzVlVw?=
 =?utf-8?B?RjlHRlV4SHFQUnE5UUlnVENUZ1NhNXFQV3BhT1p2VXVjRUdUbTY4aVd3Rkdx?=
 =?utf-8?B?QlA5YjRiYzl1c3RWWFdObkttd1ZiVTgrUW1Dc2VOaUwyeTl0TW9VYlJCa1Ex?=
 =?utf-8?B?WGtUcjJkUG1xQVpnUGljbFVGTHRGQWF4bVF5RzNwR3BRckNmcXNNZE1kR3dx?=
 =?utf-8?B?VllsL3phbHVCZkFQaEFOeU9EYUdqcFFwVnh5MU1GNDlvbHMza0Z6RkROVzhu?=
 =?utf-8?B?dFk1b0FFYU5VZWI0MTRHRWpKUUEwSGdNTE5IcGNsZGxsbS9WNjZrTmxzbFBp?=
 =?utf-8?B?Z084eGNxZkI1Y0F5TkIySzRrdHd6TDNnbXVqOUh1QnA3ZmYzcDlPdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6754879637DD7438223912D4520449F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	gNxKHquGQzY3YF2k4bmahJL1JM2N3ltCdG9Gx5aJGXaJ4psw1aIeJYNPrliO+HrIOVE38yq4hx8QIupSnp07yr2S0i2pyrUh/f6IR6W5NE9Fhnkqakes57fwqGoOfNgisAEA0wdaUG2KXvPIm7MaXTXGsURcVi1RthkYvBelauuBh4r9mn5wRE0Ln47TeW+J8PAe8WGqkH5q6Kidudr3lE47Cntug6nADaWmszR69xHsssoecnITGxShTUX6KDb5DJ1jOCobqKw36yEO4o8S/LYhBqUqstjmbTgiyE8uThRvzJxaWGz5+02ftc2PUwuF4GBE5M9vcmOrXU9Bb/GuCw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	USp4j0+YnjrLOw/po4KmVjZvadjbRj7O4HJEhn7L5eANtIgAU31y1XzbeZu0SkxJLJYk4jrnh+sTvAhItHo0aMXk4/+llxobrynroSDCdbd2YkeIUpuGaOiWBD6nqOjajsC7bALwUR0qh0gaaRRw2/WOuemEiamr3B4cTpLOGfZr2j0x3rC5IddX63TJ2vyaxp3oYBgA3HETka1vaslhAL9H5zKe1Hq87UnzGwPJOxbhyUb03Pf9AuIWPRDUq5mZPTjGP1NMhJcsH+qzyOYLDVb7D0sdri4Ku/9x6UcnDy/deWODLcBRAXZ2U1ebTmKl4eCpiLxXxAz/gFpP6VWLnMgrOLZDO40nfP/oGVK2yOYTgopA8dyVFJt5lsLHL0jtPRrUrjVsQDLW6JmRr8SoePP//zg8akkAabZYvvTJvRM8/E9vDroaQZVUiHXppkenSYTghKD8Z5Wf8EvZIcsoRobmAwv1uZyC34LNcym85LvN0SnQfq8UxivwWuk9KqdeyNfaObQ20kv+sA67hxoeOMVza88BIljgC1LDOmq8u+xCkv2bNhG/1YLnbPaL25WNh5f3wWmbnIBhxCSxGjMRBV+NWnOMrbUx1QcdfW2j4Z6uRnm556llge/PL/d+jgE1cIvDHm+QwQitMdaSDNCjRw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17910d35-b080-4a63-4511-08def27e8176
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 23:17:08.4904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3FwZK9FxntVn3lmDt9BaGDnFOgWfZAobp/fTnlfZ2VIZu7K1sCs3dhvBULDTHmi0TjCLg9dsEZvv6A60WTPCPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5918
X-Proofpoint-ORIG-GUID: 9sGzBdycnXFvI-JcQGlIUjNyuGKIaE8K
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE4OSBTYWx0ZWRfX0w1L9n1rERw6
 +vfoZuWNl6wlbe3WFFSZ2qLz37itUSBwB2l2Muxuho3DFLIYmRsZ2JzGvfLmMe19YUNqMU9U9eg
 4rsxCfI56rtR4Wny5iqdtqxjDHlEoA8=
X-Proofpoint-GUID: 9sGzBdycnXFvI-JcQGlIUjNyuGKIaE8K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE4OSBTYWx0ZWRfX/J4eegLzbPId
 ym8C418woG9hMqkGJZ5/j628H+D3gg0wcXg9Fi5VZ7+dR8MNH7JMEUPEwTg/JHW1wWHkjy+qZPj
 jVnF+L/CofjxD5dqcLsFLB/Vew1NgZO8nJBi9kLakSm+aMrkW9w+lD0jGYZmYW+Bdjt3kok7NMO
 a2CY7+SD/5Yx5Qk7lFUorHVtB7LKOYfzSeN18b6DKLptEjZqiVecHU4klHdBaRVHCf8U3XMQT+g
 Mu3NuPmekTZ2nG1zgVcpLYENmCRhUollNfjEoSo2ko7drXIm1VBmSIz4nDJ9gkQuC03ckPIjcK5
 l6fNI0tT0n7zVLuxkH10HsOfEewyP005zT1KjnYneNEOGTMZz2QLkU+fm03BYF3+74GFBZK/4dk
 EB3jWWpBOFSwDXfKXfDBweGb7uxdkx3BZ22aFuVE2uSfjYjoTqD86t5g/hhqwb5RYny2i1amvjN
 wORU+lRt3g+YtygJnlg==
X-Authority-Analysis: v=2.4 cv=PNk/P/qC c=1 sm=1 tr=0 ts=6a7272fc cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=vggBfdFIAAAA:8 a=2O5IF8lle3U-ZteHLE0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608040189

T24gTW9uLCBKdWwgMjcsIDIwMjYsIEppYXppIExpdSB3cm90ZToNCj4gTWFjIGhvc3RzIHNlbmQg
Q0xFQVJfRkVBVFVSRShIQUxUKSB0byBhbGwgZW5kcG9pbnRzIGltbWVkaWF0ZWx5IGFmdGVyDQo+
IFNFVF9DT05GSUdVUkFUSU9OLCBldmVuIHdoZW4gbm8gZW5kcG9pbnQgaXMgYWN0dWFsbHkgc3Rh
bGxlZC4gVGhpcw0KPiBjYXVzZXMgX19kd2MzX2dhZGdldF9lcF9zZXRfaGFsdCgpIHRvIGJlIGNh
bGxlZCB1bm5lY2Vzc2FyaWx5LCB3aGljaA0KPiBjYW4gZGlzcnVwdCBvbmdvaW5nIHRyYW5zZmVy
cyBvbiBhY3RpdmUgZW5kcG9pbnRzLg0KDQpDYW4geW91IHByb3ZpZGUgbW9yZSBkZXRhaWxzIG9u
IHdoYXQgZGlzcnVwdGlvbnMgeW91IHNhdyBhbmQgb24gd2hhdA0KZW5kcG9pbnRzIChlLmcuIHRy
YW5zZmVycyBvbiBlbmRwb2ludHMgbm90IHRhcmdldGVkIGJ5IHRoaXMgcmVxdWVzdD8pDQoNCj4g
DQo+IEZpeCB0aGlzIGJ5IGNoZWNraW5nIHRoZSBEV0MzX0VQX1NUQUxMIGZsYWcgYmVmb3JlIHBy
b2Nlc3NpbmcNCj4gQ0xFQVJfRkVBVFVSRShIQUxUKS4gSWYgdGhlIGVuZHBvaW50IGlzIG5vdCBz
dGFsbGVkLCBzaW1wbHkgYWNrbm93bGVkZ2UNCj4gdGhlIGhvc3QgcmVxdWVzdCB3aXRob3V0IGNh
bGxpbmcgaW50byB0aGUgZW5kcG9pbnQgaGFsdCBwYXRoLg0KDQpOby4gV2Ugc2hvdWxkIG5vdCBk
byB0aGlzLiBIb3N0IGRvZXMgQ2xFQVJfRkVBVFVSRShIQUxUKSBzb21ldGltZSB0bw0KcmVzZXQg
dGhlIHBhY2tldCBzZXF1ZW5jZSBudW1iZXIgZm9yIHZhcmlvdXMgcmVhc29ucyBzdWNoIGFzIGVy
cm9yDQpyZWNvdmVyeS4gSWYgd2UgZG9uJ3QgYWxzbyBwZXJmb3JtIHNldF9oYWx0IGZyb20gZ2Fk
Z2V0IHNpZGUsIHRoZW4gdGhlDQpkYXRhIHNlcXVlbmNlIHdpbGwgcG90ZW50aWFsbHkgYmUgb3V0
IG9mIHN5bmMuDQoNCkJSLA0KVGhpbmgNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmlhemkgTGl1
IDxsaXVqaWF6aUBhbWF6b24uY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZXAwLmMg
fCAzICsrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jDQo+
IGluZGV4IGJmZTYxNjE5NGRmYS4uYjU3N2ExYjc2NGZjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2VwMC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4gQEAgLTU1
NCw2ICs1NTQsOSBAQCBzdGF0aWMgaW50IGR3YzNfZXAwX2hhbmRsZV9lbmRwb2ludChzdHJ1Y3Qg
ZHdjMyAqZHdjLA0KPiAgCQlpZiAoc2V0ID09IDAgJiYgKGRlcC0+ZmxhZ3MgJiBEV0MzX0VQX1dF
REdFKSkNCj4gIAkJCWJyZWFrOw0KPiAgDQo+ICsJCWlmIChzZXQgPT0gMCAmJiAhKGRlcC0+Zmxh
Z3MgJiBEV0MzX0VQX1NUQUxMKSkNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICAJCXJldCA9IF9fZHdj
M19nYWRnZXRfZXBfc2V0X2hhbHQoZGVwLCBzZXQsIHRydWUpOw0KPiAgCQlpZiAocmV0KQ0KPiAg
CQkJcmV0dXJuIC1FSU5WQUw7DQo+IC0tIA0KPiAyLjUwLjEgKEFwcGxlIEdpdC0xNTUpDQo+IA==
