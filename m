Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010061.outbound.protection.outlook.com [52.101.201.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46363C1082;
	Mon, 20 Jul 2026 20:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579271; cv=fail; b=B5MOiGQXPtWDVoI0E27I983A2RkVg0sT7nz9BigNAizR2/z9mOMMmjJdYHkLGDAs/EKhIazYd4quqsMknWbYYMKhRpkVveRMWio+qM5mHvtSDVwo/EaAPhpCMJRy6MIXOE1U0/L2h8QVtD/HsxfT1OobY7cCQbdiG+Gh5d+jddg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579271; c=relaxed/simple;
	bh=LkSpOdpoKXijn2gjq8SUAnjVhDXNuQgDGpViE5vwGEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YGZCT2/hG2q88f57KNYsSm/ydRSsFkuBgdAdfXNLQs2rwDkpM6/OKE6lla1O/LVluHq8sBJMTJYkLk6csgHieGuzzF/0m4ZRXbSj2s6dDqXLHO1VmSXeZUeRnZdRKweGRz8z3nEfxnpi6mTk/0qcWrcfqLZ78HzHRhQwz3owLTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=egVmCbBs; arc=fail smtp.client-ip=52.101.201.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="egVmCbBs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLXrl+mAhHfAmOcf3ZxaVm0AwsHRkDD1GbCAj8D61ErRf90XulZX6cE6diRMMDEMHS7gr6aL1Rao/Y1tVUK57hePvEgs0MxiwP4TzuFqTJ+JLx9QhSt8dN3NGAj8T2NpgY3/ZQ9wIUsAHE/d6TsRPr7O0FcswCWtVwvidAIv8X3TQXKY8Luk4GDrLSbZ1CFo1r+g4vUIjVgCNSDerhFF5GLeBRAybbCpbyj3Rh9wsluY/UTPvX4p0OacKndeTHasxJwRvF654jsqX5fKMwg4O8j4tDO3bXIUG4L7PhuiYwFfdJtZ2imuP77QCW9oQFEGB7n4IdWV8EnYSxWbNwi3jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOD59DBfNcQ4vYwMGitQXl84urrGpQf+PpdF3KjRHRo=;
 b=MKPHqyYj6HwjRHxSvv+ocpnHP+BazC7UI3Fy3c6kDlR7eOYNnPorK4BooH+5OaEZVdYn/WeZjAF7+x/vGKIhVQeSoFWYxtXp42H1NDaHhP0quelNg4gw5VZtQT8GQIIjpnBSwCsw1kGQrxTr51gLotF3aETeX6tRbMJE8iyObLWx2zF4vAP/ny8piz7Ckq6TwH6DbBXVKG54TGNaGCC+w3P1sNzQkazlSBN3uJbsV0+tGg6T79YXQLxkiMYw1yWGXyDHt9IJ8hNku5Y8VkLqvD2Prhg0GkX40DlzL5l3lua59DfSJ1jrkYEmTTDBiWdXfQAXddi4ihGPxw+I8MNMDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOD59DBfNcQ4vYwMGitQXl84urrGpQf+PpdF3KjRHRo=;
 b=egVmCbBsPP++CFaTs07FPTBb5qSV43aqnnTOase3HuuLj+fK3QOIscTbyc8wY2MxMqCO26fx8sYAWpbC3YIR5IMEMY7fxHXvKr3JSwg5EIts8kzmlh/40P6DXRl6tn6ru3bb0taG31t0kWQ0YbRSYfKGOEpXu528XcKdzsRhMj7SRArLrO0gArY6vxXlZRUubc3zgiEQ1LpwZZFUVN6f+lDHQEh57XvX7VcGcmUQZpu2a9675QzxRmWNV74L81AVAVmQXMu9AkMUrHNxqXZS+/CP/8vh+ILbaki+fs71umre9JhjP2LQucPwWkLxMbIo0rhFJkhIk5Lr93ZFmf8qoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7540.namprd12.prod.outlook.com (2603:10b6:930:97::15)
 by CH3PR12MB9430.namprd12.prod.outlook.com (2603:10b6:610:1cd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 20:27:35 +0000
Received: from CY8PR12MB7540.namprd12.prod.outlook.com
 ([fe80::4eb1:ab21:a9cf:e72a]) by CY8PR12MB7540.namprd12.prod.outlook.com
 ([fe80::4eb1:ab21:a9cf:e72a%5]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 20:27:35 +0000
From: Lucas De Marchi <ldemarchi@nvidia.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	demarchi@kernel.org,
	Lucas De Marchi <ldemarchi@nvidia.com>
Subject: [PATCH 3/3] xhci: dbgtty: Drop extra call to idr_destroy()
Date: Mon, 20 Jul 2026 17:27:16 -0300
Message-ID: <20260720202716.76000-3-ldemarchi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260720202716.76000-1-ldemarchi@nvidia.com>
References: <20260720202716.76000-1-ldemarchi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To CY8PR12MB7540.namprd12.prod.outlook.com
 (2603:10b6:930:97::15)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7540:EE_|CH3PR12MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: cad4402e-9e7a-465b-f4d9-08dee69d55ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|23010399003|366016|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	xS7hkA81tyereupdO6fYDN0QQ3tLVItghl4NykOa+VeB7oitHDbBNgopEzp1wHe2dnMY4PdSyP02i7raVpsW5lRRltnBikbhiNOtcGrivFElUJXREYBf0QrM/7Q4PwbSaE+1Mo5jdgsiL3RXg39lrpxVQRENLzQRJZnIUcGjzR7dHzBvkTLcTkStCigEcQsGNy2a8YI6s/R+QvUSMmT8k7tWnbSWKi4odcilGp8l2x29YrEQaew1FJQR6O8TAXyKFIR7GGheKVszOjK4IxFJ1LHB/HpNiH6tpP2b++DFJtXiPd4TDTh9rUjfsJwUN/xmlGHw+vUuu6pDW97EnSZ0UxsO5BLT5WeRGoK+P1aLzwpF5GPqKLbL2/bGCW1GFqVV9ATS+dEGaXzfkZlfDU234y8pozRnqsI8P7zeLYjDyEw7nbZ0D4fPlr8DJfQDsfB47WcREjJaiUWzL7YPK1SNSDhdcTiDXLoWeDrg+FZCe/gBAgefQTNcZwss3E37fdg5ib5Jj7GgeHnj90hS3Di+WrUItLtYJYytTY4h9PDsOjZVySkecaPYJEHtfdVVU1PIHIyygkPHyOJoO7vZMV3+GmWG+pCz7bUzUP7My6F4jHEopwRXXwFdMgo/xSeumB0XWsOB4DTGGFJWpIt67jxF83shnzQKqmaDe1ou+dFOK4o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7540.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JkL2LZuOeBbvmSfl+FaMf3kHF5Ez5/au5Ad7IkWRS0kAScCo0v6SOMngGa4Y?=
 =?us-ascii?Q?TGj3s8U8fLlKKo46sNvqXSzzWHTg6mreoHe+Qv4TlgBOHnXzoFEBemaWBMc+?=
 =?us-ascii?Q?2DVOj/7KvAkEOP3olk0V+/P7VrkR4DcIcYcNFMvmgXnNQbMaxVCf8LvekAPo?=
 =?us-ascii?Q?VHuG0SQkyyUFH2QYigvbBdL/cAnewdFp6u5juMPRf5fC7N7hsrs8lcm792cd?=
 =?us-ascii?Q?71KTUnbzZX0/ymG7F0w1p++Sjstt7jlK5QF2kSmc+8TvALeeC4ZFORCbBm3x?=
 =?us-ascii?Q?j7rlrEqlz2DVb5YjHCG7JNf6dwPo3By7/I//g0Nbv7zZ8eyvxmX6K/76n5UG?=
 =?us-ascii?Q?WsxS0T7Ix7nC1H1hKS9If9PUEvFMlyrd4r3jbxIsEV6NmGF9HRcL/2J9qeJa?=
 =?us-ascii?Q?SFoU7UifCCCxbekMtGTjDjShIc6AlifnWlqN+9XzBoPq8k2t5d7zLZeO7x7c?=
 =?us-ascii?Q?tsoXk9+kON0kMw6WY5FbmxE4YLLcLNCZTqE2JX0Y59gmsagGDhINSr9vHNAZ?=
 =?us-ascii?Q?NcyI4xgDFMTQSuRRvq/JfJ9nP80p2eWK+o1MJU9J5dco6XmkVmleASWWTEdY?=
 =?us-ascii?Q?NVotRCnd++Kh5wjzo3A9FoIoPeEt16Lu73RbNinZD10Y+e+d+k0Gx2tw8fSV?=
 =?us-ascii?Q?/xdztNKTn67zi1r54XUZ+2x5GvBIclnc9IH8UPdqkbfi1fhpxru5haYdpzvm?=
 =?us-ascii?Q?KUFV6jpwYo2LxO7uTxfFvXV0NUt0056+iwb1Q+Jgpn9khAidEpFHylTsDSR3?=
 =?us-ascii?Q?n7OppvB4H2ml0NLHuUsQMNK4lvQx7IsFxTjFi3Q4YykB48aDSa0oHG4yrahC?=
 =?us-ascii?Q?13hyQ66R831am1ku9MPsqJt4CB0SMz7Ttvhlz+UfDX5HKjrjMZD0KNI8JGdZ?=
 =?us-ascii?Q?Gsi0VGOpsJvqKziGHT2/V181kKzWCqLa8MxB/hZcHN5SvMiK8aQ/1uFj1e5P?=
 =?us-ascii?Q?9Pxpln/rTuV3zLkTKca7VQynMY0d55Etbez1/Z1/dPJa+7FjAtlbm2BtL26e?=
 =?us-ascii?Q?0dSNorze3xyQTG7rSihUH6IeLtRVZcEyqUpRpr2exkJ2HG3B6i8PgJBa6o4w?=
 =?us-ascii?Q?tyxoUQTiWewqeeYn4qq1UAMLG0l9K3oawseSnZprxIniYf0epkNbyGzQGwb4?=
 =?us-ascii?Q?sT5XgYZ9BDZsdiinETYfkdSt22Fq/CAR0SIuYzgobxlbv0G7dSeEILAraYJ4?=
 =?us-ascii?Q?zArN65Ufq6tDHlZGN2cF1wDqQDq+PnaTj4KmnHhRPsb08cGR1tHQIeRypfkP?=
 =?us-ascii?Q?RBmkcY74KV5iNPnznyOMKdxePulAQOm7j4dqq9x8TeVoDaxEi6bKtRzG5Nvy?=
 =?us-ascii?Q?6lS1IlwXdQ6oiZ+5MsxRNrUjEUeXugVuQGLFmunGW8tLivUa7hduXhN5Q/j5?=
 =?us-ascii?Q?9r19YZsYeHG5sjKOwTyDmHu3t1UTAOf9Y0OJhKdlH3pTrm0yFZri9fEM+2Fu?=
 =?us-ascii?Q?JNu9g8WtHUCFEkDtHdyq8dGOy3UJ5PS2KmdACCFN2gI7/GryEFjgbqhpn1gF?=
 =?us-ascii?Q?RajO13FqQYNcrkLnkZHafDqVgmJC8R/67hwAgeJ7XxanMoIrC0mmyCZrwDHo?=
 =?us-ascii?Q?e2uJdhfNZVfCu1Mm1hBViZf5fKnrxCeWMJQ8sNz+9a2Kb2EqJFzOTbHqH0Np?=
 =?us-ascii?Q?/PQ3gRtwX3DqIggTBZkKBtZTG1Cw+0vZ+UfJVcTM5R7HVj+RjkpiZS2uzkkX?=
 =?us-ascii?Q?mrsZzdvxUOrUgU2wPyykSSkXBNG+6XWEs7uFfnYdr/1UUmIb4T13BTeTvSOa?=
 =?us-ascii?Q?H2DlWfeLvbleXb6qlz5PDfoeyoDW8w74rqTJUGP41Iv1+A+IXEYal4dz1ivy?=
X-MS-Exchange-AntiSpam-MessageData-1: aN+IYu4s+gVoog==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad4402e-9e7a-465b-f4d9-08dee69d55ab
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7540.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 20:27:35.5870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7jyDOP0ZGpf9PUDN+8Q8OV1F8pqWnmaLTcW4GaL7bKXmmPsNsS2TW8QXYMF4KdwHgblo0QgRPg2AMgKx448+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9430

idr_destroy() is already called on error paths in dbc_tty_init(). Do not
call it again on exit. For symmetry with the init side, also use
IS_ERR_OR_NULL() to gate the exit steps.

Signed-off-by: Lucas De Marchi <ldemarchi@nvidia.com>
---
 drivers/usb/host/xhci-dbgtty.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 7e44e62d6ea9..3d51e8d82659 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -665,11 +665,11 @@ int dbc_tty_init(void)
 
 void dbc_tty_exit(void)
 {
-	if (dbc_tty_driver) {
-		tty_unregister_driver(dbc_tty_driver);
-		tty_driver_kref_put(dbc_tty_driver);
-		dbc_tty_driver = NULL;
-	}
+	if (IS_ERR_OR_NULL(dbc_tty_driver))
+		return;
 
+	tty_unregister_driver(dbc_tty_driver);
+	tty_driver_kref_put(dbc_tty_driver);
 	idr_destroy(&dbc_tty_minors);
+	dbc_tty_driver = NULL;
 }
-- 
2.54.0

