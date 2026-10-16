Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013068.outbound.protection.outlook.com [40.93.201.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75F246AA81
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142924; cv=fail; b=S6svfoQnUZxQKJQ+rtBu1L3XRZs/3Rv3DFcXsv/VGRLPCT+R2YwGLns++dYj7KO160SWfjkyyqGZTkAX4B9edWOPs2zWxqVYazXoczUIbOKkBgd9j8tZnPQ6aahqgYX/VYfkqdX/y52B1f9Gar4ANo1GSgiNpZtZDDx4eUHLr1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142924; c=relaxed/simple;
	bh=zfI7iw/4mw5zSBcjuzCEvXEvLoXRy81Tdy+7kQ2bk8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p8NpcJZ96actvxjB3UmmND9Szkb0Mcy5NdUeHxRtzOQN3sGHKys6ObsZbv2oRSX2q4mH65bpRXgoaZeA4PpZaAgJrxsLA9OGuEU5992zO50js8B/lCodM3e4MUaeMvhIc3esNaVrqerngNtrJJv7OtRGyPcM392LmpP2Inbfv74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rS2n+n1n; arc=fail smtp.client-ip=40.93.201.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rS2n+n1n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMV66mNmaaRKh2ZyT9vDrHwcPmjtFPGBwhYu+wSo+/0DV6jH5OTWS1BwMBFI4onZPH9+89JQd8W1Eme+qScmSSivByVwKBB27D3B6H2F9G8ZoayPXN73MOX+1/Nd7jj0g318AVeCrnxsK2H5s7yr8+G0e15uG1Ur+upuPMERVBOQXkf/TxKTOABu+18hTGwWdOnhkyI0SvhW3EmNLHOg7Zh25L7kSdb0hb7DAzSxufDNaD3Ui3VG9TOkVPAw2kwT+8Qh/40tiP8wJ5iRl7rmRG8DcfVJknhsWrw9n5FBoFGI678/ij5+U0YfglRC8zkchq0CD8i0kCt1Lhvki4N1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sk9q/8rsq7pET7lGpt0z7vQw1pjnkaLB6e0paQ59H30=;
 b=MyKgjKNUIjryXDrMocKWX9hcFeRicmtVemYS7fAhHxzCnDSmhABEhskaIFhsKn5UANlnh5rBmtJ+UH8yQvsm2PqD7bBpQYntqmky3xH/EkxNQv3mZJWu0wlJIq3pFlmWH+fkPf8eDKNI1zMqMQARWwEGhb/9keQRG4RFIOs/LVLbuUs7G7ZlKX7ICOWWYRR24cp9RWO9Fa+EBfYjPQgWTtPjDsX9axyWHLofhfxSZp2mDq9bYXRiARmprZ428t9nnKf5ZIkF/Z8HzzsJAbsty4vPEtXW1hMH3AV1XC/xMkj/iM1nrqIDA+i8M4IMSlUeslfIM3jMerpfZO1LiHHzDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sk9q/8rsq7pET7lGpt0z7vQw1pjnkaLB6e0paQ59H30=;
 b=rS2n+n1n74rxI4oE8FztLcTTqX0j08ORFByvyanp/InDW8cQ3/TaAOdmvVGIW6EIKxFbtdyAeb3AbjXeK+QBfKk/TI+Dx4t6FMEhZsZesWJ7XcLafqIrsZRVpiwyPr+QmGL2alBmOKODMX1fk6x2QEVBggjvGSPG4VNYmZ5Y0e6IzlOyksTTR3zuYPvJVvXoyYtpuSVX9+3I9ZoAAhs3ZhSSk5eJNhv3lrrvgiap0gaF54ZQkJkCyO33BAHAg1Ax+tzsnSRToY5OZ659h284Ac2dl1Cqodp+8UlJDPW6PlesGKO+xMdFW3MxCPL2p6G6TvVTIzVzOPHtuMs7UXV9Dw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by BN5PR12MB9539.namprd12.prod.outlook.com (2603:10b6:408:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 09:28:38 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 09:28:38 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 05/11] usb: misc: Add NVIDIA LSTP USB adapter driver
Date: Fri, 16 Oct 2026 12:28:15 +0300
Message-ID: <20261016092821.2049721-4-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168498@kernel.org>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-5-aambrozewicz@nvidia.com> <sashiko-outbox-168498@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0191.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::10) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|BN5PR12MB9539:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb47bef-3d43-4fea-6d1a-08df2b67dbd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ez8y/SxXvBlqneEFNdhzeq3/st9XBJeXqOmhy7XWaZJjArPEq4E3vcLuHqcIGAaNuqi35IVhCPqMUde5oDxwtxhTw9PTAmXpFV4Dim590kbZzxlIFUUU+4NGAvphZ23OFt5UNyMKdm9kHSmvzfmJmrMUuAl4ISxc3ckHVYh2ljK4J7hP59H5FA+EfgUZ5zyHEUPIGKFMxQz2l+TR2We/OgXMOZk5AF4HPMgM0Vfqt2a7nE3+6E2M4fxoNHSkzFN1dfvYBwSuo1CZJp+7NXqijUYZakpYCHbhSbpWAMwi4dJdiPplKO+SKRxKd1LJ3Xk5tBpD14mZ5hdcgNADFgLpvKNZeXioh/VzdRXL/k/8Muh/KNWKd0dV7vK4ZL2dHldCDbOxxq/dR3oSKuwDK5qNXdfpinqhhpZZNfyUZaxvshiCOOEPNr3+Mxd6Km6n+T82847cd+qCKUdIZNr1N6LXrZTpC7tJ2sZH+7OfRgN/NMBj52bfmfPzKUZEkN436VVkeZ2c6QRKysbukTSW14T4h15KzL0G/YVbViuWtC1X6XP28BsSWmosFxyUas8ML8gUXDQz1fG+mnTeRwKz4wHnvi2DlSDNCv3n5ezwEiO9wc+7/1C5+2oe7Xvk21nK+hN7f38U3Sp9X6CuAFSo2DFBO6MD03e6qXqiw4q7+z1oxMI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M5vzLtta7gM5k+FibHzw+1cNs1yDRdQnRWE9p8HFvLqP3WIOVmdpiv3TCDbo?=
 =?us-ascii?Q?OW1/FC5jlGv5IgqCY0ckuEj0Ml6YtS4KbuskDXm4hjr8taSLqTbvraTPyqne?=
 =?us-ascii?Q?wuRW1y2lUN4U2oxGBMcDu6x+dRG9SBBC4wPi/t1s9r26vUWRgpKuWZsWwx8s?=
 =?us-ascii?Q?4Hea5E/m7H5aSiqNFaucWalPEra3FB2J6ULT9qFmOKHRYPWfyT5N3R+wEsPl?=
 =?us-ascii?Q?lBfKcdQix5jVvinodedmE/1MCLQDfUt4X7T1QpcBFBHpeKhD8D09wuaTgECT?=
 =?us-ascii?Q?kGNFy3ol+uLcz6zW9hQE43cPky/4mbVDXN0Kw0Un5wYFd3oBrwHu5Ln+RFgU?=
 =?us-ascii?Q?FuifcIq0nU3tMCUSy6KYCwGi7AlKdD61han+sD2+QUMimABWZlHZaD14GYJX?=
 =?us-ascii?Q?nXdFMZFGHZBE/+ve5mauL3o60vPequUk2DdRQRT7ma//EVPIy5bH/C2zgw8I?=
 =?us-ascii?Q?G3OQ8Q9Wg6xWp0Ytw+trksjzlxhxvnOT0/qOSM4xRVtlauCqnK4KVIVhnVk1?=
 =?us-ascii?Q?+EMMmRb1MHHq2PH32ovC7NKhB12CEyRYtC1ns1zk7MOsLCZEjFXKhqOc/CCh?=
 =?us-ascii?Q?JGOANh/x5GZwNbdFAMjHAA8CRrBGhr/H6wsqiZnjLh4D+ERwqbPmRiaHKgpj?=
 =?us-ascii?Q?iF2TnAkJEuaemUkjRcq7wcAug4yKQpBgVBbG4OkrBq6NqRLkct4crO3epJfh?=
 =?us-ascii?Q?SLAHBnkD886J0CvHL4XEKxTkxY9B59lnICGYDvl7a/iXS1/2qkzo6AWzn5F1?=
 =?us-ascii?Q?t0uIWkTdAZHGTj61FKVnP8tuQFnebgTSKl+E8vITK4p/IkqhW8jrhnS9KkyS?=
 =?us-ascii?Q?fqyIkQHz936TzipOczk9miy619OlTAfg6Lu67UF+ADzpW6Xacl5/O2WIGAcD?=
 =?us-ascii?Q?Lq3lD7iji7z5/eaEnPZkiUj2/ANWNX++7guplbFW6IlveCU3P1G3au9xWCrH?=
 =?us-ascii?Q?aMK11eX4MZsghqeTt6UJsnAnu/RM4e/W6A+MnKeZZdx6VflksvZzm5cNZYHr?=
 =?us-ascii?Q?Vg4r5LxZ/ZLeOvKwPbv5BCtVgOWZeCQLZ5LLs8SDZX1DXh49PXRf6mtXCXcO?=
 =?us-ascii?Q?vg9FwHVCCQV+fKvvRnHSRsf1SiZFvzAeYFIDdJwMztV+H1LO7FUDiUUGFzDX?=
 =?us-ascii?Q?/XvZCT444tx9BZ4yw7uV1BWFVH+5UJcduhoU+NCKIczDN/rWlVPm9dUJcitQ?=
 =?us-ascii?Q?4/6xfKLjBS/8+25lZaVElxFMClxf3w9ESerW/tqGJFF0hZCNzYu3l5PBXc2X?=
 =?us-ascii?Q?Mk5UjcJNOQmOlNbKSI6hlCh3NryLwIAuwnXBg2ThyDJyZ+61oPL4mJ7U+LuK?=
 =?us-ascii?Q?mUHYBOhyxVPnETa1n1KwE/BnrYQ772h36qLbwH1N8P7FfEjrWBVz+eL0KFbp?=
 =?us-ascii?Q?mefW5c9e4AgBOwNODi8fuvi7hQQVNQcuhjqpJ1nbGV6NZp9ED1WR7TjRXUFZ?=
 =?us-ascii?Q?DmYmuaZ7C60cMnhatr4+Q0gv7b7oMjqAAFFLT9T6TcNuu4XACkl6QZtytOOY?=
 =?us-ascii?Q?u2NGoDSwz5aNXGaQ+wbcYwl1gXzzMRcWe+Q3ygap7BAqo5d+T/81/jRvmL7l?=
 =?us-ascii?Q?BDk7CAsjNLTqickmiX2Hz86f1HejgDfZSD+gvAGFbxtZ9WGnvq+4GyZvwqqF?=
 =?us-ascii?Q?I2TsjgPuXFE4w9NbD5JHS3e/LisZ57FrIXsOnuyV1DbACYZ1bEExC+cc+liu?=
 =?us-ascii?Q?1H+PbcT1CuvqEUsPOUNgzNlywRMlbsmLWf0KGFOos9A01DuNJBQBgDwExb6h?=
 =?us-ascii?Q?//0SO5G+Hw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb47bef-3d43-4fea-6d1a-08df2b67dbd2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:28:38.0202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtb78vSwNVnBIj0BAzFvLA7/geEcUE/d/tWvXSMIh/T4MbxBcLYQO3EuZRzhabQ2szhRLltmvncfwrrrwPv1Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9539

On Mon, Oct 12, 2026 at 05:51:33PM +0000, sashiko-bot@kernel.org wrote:
>> +static void lstp_kobj_release(struct kobject *kobj)
>> +{
>> +	kfree(container_of(kobj, struct lstp_kobj, kobj));
>> +	if (atomic_dec_and_test(&lstp_live_objects))
>> +		wake_up_var(&lstp_live_objects);
>
> Does this code have a use-after-free race against module unload?

Yes, here and in lstp_channel_free(). Once the counter drops to zero,
lstp_module_exit() can finish and the module can be freed while this
function is still running. A completion has the same problem, since
the release function still runs module code after complete(). This
will be fixed in v2.

[...]
> The Linux driver core issues BUS_NOTIFY_BIND_DRIVER before calling
> devres_open_group() to create the driver-specific devres group. This means the
> devm_add_action() call here attaches the action to the device's global devres
> list instead of the driver's group.
>
> When the driver is unbound, devres_release_group() will only clean up
> resources allocated within the group.

I don't think this happens. The driver core opens no devres group
around probe, and both unbind and a failed probe end in
device_unbind_cleanup(), which calls devres_release_all() on the
device. The action added at BUS_NOTIFY_BIND_DRIVER sits on the same
list as the driver's own devm resources. Since it was added first, it
is released last, which is the order the driver relies on.

Adrian
