Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020139.outbound.protection.outlook.com [52.101.69.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A831B39CCFE;
	Mon, 10 Aug 2026 07:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.139
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345941; cv=fail; b=tKzKIijhKPV8n4mbippbXK+BHR2NL6xiDJNVrmI8J/2FmdIg20Dq0BB2+jK5S/zCzvZypbJYIaMksfrFLfeixjXjBBn0AB5tOn7mANrL80MarVrvK9asdZyc35aSqDK2JX8FJ3GFTpyWVBPxOXVoMLdCdPoWVH+//Q5zpz9+FdQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345941; c=relaxed/simple;
	bh=b/tKKvM2jJE0LZTZgyiX+DtXMWWPk0yt6CAPS2X4LF4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BJpLiA3r8lr7SuYNXAOfCVlda9NljYBp1oqIc+bLgScIo2Z1c4QYqFivQobo96lN5b/ASBlCEjZ899DedGtXZBFBsU06L7dvgZ4aq+4/MFAk+Uxm1S8gtYvachPl3H7tKFPMtneM8Rpu5Qz0BGM6UtUC/kMX76cfvdQ1Caw7zhc=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=iCSGDCTh; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=iCSGDCTh; arc=fail smtp.client-ip=52.101.69.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="iCSGDCTh";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="iCSGDCTh"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Yn+2NM4HHQ5ediBcpFjEwnaL4vHdeXDsXg7NnxRvAhbbQQlD7pW/BBx8bT5mOLcSYOstJ7MK3k193J+YAUr5G5AVxUAJgj9dR0Is7hplc8oYCY4segx82m7RzsoKrwwkY1P8psQbGC9nUYybqcM5Bkc030Cc1e15S0/xbropf1sAcHLiXG8SV+ZytGrAGGETRcuEq6TVb/yoHEGEPxraBqAk3bpw8F0VUDBJTSoTMTrcwWKbu/gYNUt3zFfMBY0BJlrTtzjMQTwh1+PtmrtPK6HAhVM1vV0uNYC7oMmMGx2zNhS55QUuDax/LKOXav8KDunfvc3oNMH+cHOCUfVhYg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=kvdoFiy7BpIh7+MDjU/T8wGaCeorOwpbQzVMyxYyrGpIEn6ilwUbSezP55GRQfBxUrSKWPvHrO8f8AbG80xqbTJYb0H16DoO4LWCRoQQwY5BLcQtlUBzp1m9z4tN9dVxrL5H6AHnvHRbeyazJsigB7TElMLCVKWUkT9l/hGmBkcuGmzFmlEr45gJrk28iAlM96tjVYwjbSs8tU8iipNZxiv0RrLCB5kkPxQMGCf/eihSfPnVEAGLaUQkheuL345oprI+qZobisEbddyHfpbCrhiOg5hXZCBzwWI5rACFsMUweDOGVozS+8uJGMe8JlvA38IibUp5gBmw4LmBnLB5bA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=iCSGDCThIU3J0O5mGetZsuevngGXjAseiY1QuSkgmxC5K73FjofYjbWtE7WkJhVz5QzH1QohIU1StpT4m8EfSqv0OdKmbOHQRfme6Y6kSulc/Op5tL0Z4HviMsV6+VbkfkScWf55C7JSUK7q1lgMXDUHdSlc7LwLcirxrcz1nGcYPZQKnziZtbQMlK2BaPnnM30MZahDGpZ3mLq6/ZVv2aP9Ps7eH7SWly3Y/tfo8QqMdlt7DGIJUvoPfyLPUgDRy7/YpcgKv9dkamnkUfZ6byMDCoYKZyH3Sk1YFibJbrG2ufcG3GenMkSMMTbwCGkVQ+BfL6Mcc78chVRiC2//Ng==
Received: from DB9PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:10:1d9::14)
 by VE1PR04MB7453.eurprd04.prod.outlook.com (2603:10a6:800:1b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:12:12 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::82) by DB9PR02CA0009.outlook.office365.com
 (2603:10a6:10:1d9::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 07:12:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via
 Frontend Transport; Mon, 10 Aug 2026 07:12:11 +0000
Received: from emails-985746-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-157.eu-west-1.compute.internal [10.20.5.157])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id C6A147ED95;
	Mon, 10 Aug 2026 07:12:11 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Mon Aug 10 07:12:03 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786345931;
 b=DRGQlhHRmJaWoZ0BJ2FB9tgMfFtApV97X74GIY9kP5CmNPn3MTC5d3l+ZbH8e/pgPmh7C
 2ExNWBGKMn5Y5qJyTsZxuCy/yNXLOF6P2wIabcx3Ct+x3xW1RHHkvZVL14qAfaw8Fne/CX6
 oDiJ3HJftYrijh1pLWVN1kAQAyXG88Y=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786345931; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=K7UITwRN8XGeyHOV6fuklKhBhxi/ofrUFz2BZcGRjQWLvVnNLSCFzj9NH1x7UAABM3Dh4
 u9HnFQnh3bgjk0Y5jSz1hUqDdAR8KPo/pUYR7p3d+x0jiwWcC9g1exGJw2rTh8/dvQ4mRXd
 3pDtUgn9MLxD29I4b2XfyTofyIy5BYQ=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=iCSGDCThIU3J0O5mGetZsuevngGXjAseiY1QuSkgmxC5K73FjofYjbWtE7WkJhVz5QzH1QohIU1StpT4m8EfSqv0OdKmbOHQRfme6Y6kSulc/Op5tL0Z4HviMsV6+VbkfkScWf55C7JSUK7q1lgMXDUHdSlc7LwLcirxrcz1nGcYPZQKnziZtbQMlK2BaPnnM30MZahDGpZ3mLq6/ZVv2aP9Ps7eH7SWly3Y/tfo8QqMdlt7DGIJUvoPfyLPUgDRy7/YpcgKv9dkamnkUfZ6byMDCoYKZyH3Sk1YFibJbrG2ufcG3GenMkSMMTbwCGkVQ+BfL6Mcc78chVRiC2//Ng==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PA4PR04MB9688.eurprd04.prod.outlook.com (2603:10a6:102:271::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:12:00 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%2]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 07:12:00 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 10 Aug 2026 10:11:50 +0300
Subject: [PATCH v6 1/5] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-rzg2-sr-boards-v6-1-41faa32cdafb@solid-run.com>
References: <20260810-rzg2-sr-boards-v6-0-41faa32cdafb@solid-run.com>
In-Reply-To: <20260810-rzg2-sr-boards-v6-0-41faa32cdafb@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>
Cc: Josua Mayer <josua@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR04MB5807:EE_|PA4PR04MB9688:EE_|DU2PEPF0001E9C1:EE_|VE1PR04MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e96da7-df61-4cdc-baaf-08def6aeb2e3
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|23010399003|10067099003|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 mga22Zi14dtZl2WgJ22avBjGIQgDyvdCr/S90zwW0GxDOWRreTGFuf6q0Qui/O8BgPJeL1sRrxdy2NSSHgiT2VESlpifuSDWsZTJ0/lr7QTKzA8C7LMbHwwXL/OrvGyd3W11tUcew8G+17W8LQ80uWxWF3EtNZp5lThyHHo/EM5Lvu2O+SPUhqon+Y1QN/JgKvM/vjsWJCLiCiiGMCQLTEcgdzAueSza8V64Ey3UMYRx3i5Q1BicC+hFT2wEteEr/cBhOR5otiBwmstO4YiwbthFGLAvQ7nWxZ+06N1Pj0TcWvWOeFyWfFxj8rMZAbcE/sY0scp650zNqdh+yYWmoDfT/gX7G30BL+itDKb5F69I97aVUkFOHup0nrQ1hFhzowukxgY0ANHmN3urlVrkIPcG7ckO/e+hrtJytd3NUc6O5ppawPmZgBas8AoGSLeqBj+HuhSTNdPNRN4GXeYWTJ7LHgBN9jChRvvgerIU4xaXSKGm7l5r4iockGZ/c0RzPZD98pZoLaK/fPnpj7nz06HjoVzLNQf7TCULHRdBJLdG2iL8g+RkEF4HZ8cQNhjbVpu1LD31m/oQIqTQ+AS9pc11GzXQBDq6N6z0e2HEOt+NDGmGyO3YPwwtEwq6QoHmS3bl/EHxaW8OWqXPsBPy72jLxWVZw7cgUmg2Do4n+0fcx/L7x/X4xah9GIYvM0KladpJC7EhQF+euGejVWgaPOAYHXuJoT48mh6HlyDvbH0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 EXUP0w7KG6kCDCtlmAVEwsv16lE1Jit1io6pboCfcbcfB3Ihdm8kIcUfk4hGYxBVZp3rhJbjd0lMajT6HYxSHfL/90YuYqHVabHdwRImUyUy1LWjX2cEty+eI1eXGx86a6zuRggCS7ql/e9VJ7njleoYi0Eq7JO38H4+VErBLK/7leDZQPHfwlm36mJBpXqgVP+TVsNB4FRhsXenERF/YR3OOKW4RddC7qU7qt5UkYbmjKU718bKBrECZPTzvmp73chAhT7ahgAm2/RBliPjbxADMPyg04Cw6KgmpjvjQtPfChIk+A9fp2IpyOLvV6CM4voc7U0AYQw92+12g77mmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9688
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 1fbe91eb07ca48aba9c4746550d49b16:solidrun,office365_emails,sent,inline:b0c3473bf7e570ba4d5b6c15ad0b5ebd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNHW9tbqt3ISGTRemZdFVkWGXDCam5iCGuFgKzbg+0x2GwYrvkemwzHcaQWIQWpblfSSHQj/PXrIOFNhB2jJ8aS8Kjs4aWs/BbqBCuETSjoicivt+QQslLEHPudmutye3RsDBymJWPFf+4IH81JHSfXUG+Obp8t917YVF2i7BI3z643sB7Coi6URKpVb3IlRv+d4QkcEk737HJgctKZXo185cBjMAYH39Xxgn1Y+DLsemOFnSFuJwog44Xph6W1R7sI0RdsapcLimxWip5bFs9LJ0gwBSimPWK7lGzz62kUxplH60Eks6AmvFvJ7flJzrMgpN8Db7kKwfeLxqg7Ylw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=uMHanSSsrUvOEMJVGSyheTJbFXaG0yIbw0u7SUTJQl9x2lNNP5psaEq9y74/bhr6MMXTKQiTFPjTcGLOfnDv7Q1F3aEZUImWCn8jz5kmpPJjcdIyZBjO3nzS84mWPhE+QNv4EhnBP0dNP0djibo69ktrp1fm68ez31Hv7vONVLCRnx910ysgP1oENDRpZyyddGR70jnK0kI29uvEDc1AVplnaXvpL3u3pEo+zLfXEJG2WvTdXVL6f6pdbqyh76vIB+Krbo2RbBrXcu3f1gL0EDd6YS37qjpZM4IfQe2QyTm78ds6IaXL4drVjchQfRu9bwb2ZM2SnIHpVm6J0naZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd1b2c67-1a09-4fd1-d8f0-08def6aeabd2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|35042699022|82310400026|23010399003|14060799003|376014|7416014|10067099003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	v4kg07GFoJVg7qHXs6qf+sWYT9jjOcMRAzR1/86v6z165NSd+xrBhTPbfD8HTWCjM1OhWsOFgfB4prBHJlsrpjA7/L8DAi3rPHAn/4QnZ83D74fNwKM2Lg+qYXvDCmsG3+HjvGAxlhrEFbbK9A9eypl6qPFD8vwSnBTOIOw1dKmt2ihshAcgma5DQPDtS+yuaJ8bI0g8iESd/MMvJqDa2AjOIFTAB9Rmavmz2B+QHezr0/OunZWhfx95qy7rYT8Jue0kNzbEWs///pNyc7PUx/Ml6oPON4tqU2TnWpKzPn2g3shh+aK3y+fKzFj2z7gAY2dxvAxRWUXtbsgvCuEdnuQ4h1TmoyILEfsJ7fX6dxW9CWui90Fyx4zS5SJe2zyRaYOcAKrs0PlaZSZvtWtWAf7sL3RjTpww904FA5IBYwOIMUsLpc+Mz+ToJT8YbOEZs4OsVvGooAW7mBoENvagq421KDtYnzTTuDlj5rUbcnqyFMnK9ckJ5qQQMSA5WC7uQjD1mg+wCQR7pGnBPGPGaeCNfn1z6hU7F00AT6VMRG1eCtlDZpSX9Ko4PN4wBcI20mR0GQRWJ69RlQ8FxNAPyL/4gscP12jFP/CLmAz65M3xcdt8Q+H/qIWwDSKsbl9TfLZD+67vwGR7jwxHNEiTZcyRuL1TSMD8QObmW3tQmQWsLZvX8e984iw6FLxITtzA4xvB+aWTaLSSe79pNuIlCQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(35042699022)(82310400026)(23010399003)(14060799003)(376014)(7416014)(10067099003)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ansjXSBUl6RUTK84hjFrUP1rLPyhcFIP3c9xKSeGbVViB2/HrO3j7jah3d4kNmJFmYJJx5/EsKNHE7s3qVmP7oiMIv4hvYaBIOtssi5TvaYb8mbWIsYCFQnnhG6YvuNijpgY8B/wm6Es3GLAofonT+1q9tbsEPIR5B/MXwu82xbzuv3z3G++MEqdDN1HyuclcbkkZ/dbFqIPfkUW857VOUGsxJi/UqE7Dt6zteod49v8y6BMG/p6ype6+1WohL1Z5PPv2k2xtoKpMuiXYPUFc4AqAxeSA0hkkQd4Lnqn1VSr6dGiJhpKXqgPrLzl9xwGpkfEIkTqni6sPpxE4t0PJ4JZ2GhtHW42wFQ/SynZchq9+xJaAuz5Aakk28hlH89B+7MNdvpRhV8MRXRchvf5qbZFq/O4tUsIcjA3VGvs+v1B83dTNTXzqug5URsD7Fav
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 07:12:11.8746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e96da7-df61-4cdc-baaf-08def6aeb2e3
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7453

Add bindings for various SolidRun boards and System on Module built
around Renesas RZ/G2 family of SoCs:

- RZ/G2L SoM [1]
- RZ/V2L SoM [2]
  (shares PCB with G2L and has very similar programming model)
- RZ/G2LC SoM [3]
- RZ/G2UL SoM [4]
  (shares PCB with G2LC but programming model differs largely)
- HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
- HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
- HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
[5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
[6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
[7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index eeef34e3d7d0..1673005a3d93 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -508,6 +508,14 @@ properties:
               - renesas,r9a07g043u12 # RZ/G2UL Type-2
           - const: renesas,r9a07g043
 
+      - description: SolidRun RZ/G2UL based boards
+        items:
+          - enum:
+              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple
+          - const: solidrun,rzg2ul-sr-som
+          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
+          - const: renesas,r9a07g043
+
       - description: RZ/G2{L,LC} (R9A07G044)
         items:
           - enum:
@@ -519,6 +527,25 @@ properties:
               - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
           - const: renesas,r9a07g044
 
+      - description: SolidRun RZ/G2L based boards
+        items:
+          - enum:
+              - solidrun,rzg2l-hummingboard-iiot   # SolidRun RZ/G2L HummingBoard IIoT
+              - solidrun,rzg2l-hummingboard-pro    # SolidRun RZ/G2L HummingBoard Pro
+              - solidrun,rzg2l-hummingboard-ripple # SolidRun RZ/G2L HummingBoard Ripple
+          - const: solidrun,rzg2l-sr-som
+          - const: renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
+          - const: renesas,r9a07g044
+
+      - description: SolidRun RZ/G2LC based boards
+        items:
+          - enum:
+              - solidrun,rzg2lc-hummingboard-iiot   # SolidRun RZ/G2LC HummingBoard IIoT
+              - solidrun,rzg2lc-hummingboard-ripple # SolidRun RZ/G2LC HummingBoard Ripple
+          - const: solidrun,rzg2lc-sr-som
+          - const: renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC
+          - const: renesas,r9a07g044
+
       - items:
           - enum:
               # MYIR Remi Pi SBC (MYB-YG2LX-REMI)
@@ -535,6 +562,16 @@ properties:
               - renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
           - const: renesas,r9a07g054
 
+      - description: SolidRun RZ/V2L based boards
+        items:
+          - enum:
+              - solidrun,rzv2l-hummingboard-iiot   # SolidRun RZ/V2L HummingBoard IIoT
+              - solidrun,rzv2l-hummingboard-pro    # SolidRun RZ/V2L HummingBoard Pro
+              - solidrun,rzv2l-hummingboard-ripple # SolidRun RZ/V2L HummingBoard Ripple
+          - const: solidrun,rzv2l-sr-som
+          - const: renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
+          - const: renesas,r9a07g054
+
       - description: RZ/G3S (R9A08G045)
         items:
           - enum:

-- 
2.43.0

