Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013063.outbound.protection.outlook.com [40.93.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51672449997;
	Fri, 16 Oct 2026 09:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142917; cv=fail; b=QLML/lB+I0Oe7orl11zeD59+TPH5fTvWJzmm2ZnkZtd9tcvYryqrUvRamcD6nloKlVosa2RqKOcg/nxYJrUaWbEB6eFi6TF4whu2fsCHyGSVR/1lz6wY5JPmojHYmMSaR+BLIzbb1hLd7HNWg3rKs3VZR/bYnShEe8sC81dQ1A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142917; c=relaxed/simple;
	bh=beJU9rE+6TBdsvD84w7/EpKs8AGK0EqJd6BrNdhaeA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dKNJwr2/NwOTqSkftO5ELTeELvFpM6g+MyLlyhhqLOTS8NCsfkwSbKpfJPF5aADszuOGw8c6AQ8mRMX4Jh64pLq3cREpJFpCqxoplspKssDCdTSByI0XsrIvXDu0o0Gz/nvOyiRYfG5izak3tig/gDzgFvMTChgcojtkq8436/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QNzi+/Df; arc=fail smtp.client-ip=40.93.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QNzi+/Df"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MU7lhL4pQCvsBt5h1ZljYSudCnYQIuIXGlFl5aQsLOy86+NzePineX/1JcwuvEjHJc90AGoCEJ6Lmw2bFkOj3iTzOb+oUOknkaVKbeTXO+PR2+3EhQ5raNAT3DcurmS0rhIDtM0TB763FBvUBC3akpxohjk6ZOM/ytD48O3R17X/prM9JPxBi59hQVnIi+8bdNuGZhyBddz5Fhq9GnNCzUXeBZ0/zYD2fiOss0VQ3werRRpy99uFgkWlyjQSFovCKdpbuxX/kBCICBhHVNZPSLCeIPZJujgfjkVxosowQKDuWQx5iIl/FUSXikyZ4U/57FvLjzvckp+Em+XWYtLhLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beJU9rE+6TBdsvD84w7/EpKs8AGK0EqJd6BrNdhaeA8=;
 b=JwwXjf/jGXy7tD4XAaxJR1h5wRvuXR5z+BhlVssl7ZYXUWs1z3bE/Nx1FD5JxFrYRaRRJZT3KWW15Tjq7FXKdbV26BqzEqXj4WE2qtnGJqUa7SENqGyEHQ16PZDtVyV9GUBa6R35uKMjoFXrzPhQApoT919XRBGZFqLFyeo9u74hb2UVVXcQoelgI44e7494M9u86w/pM7jXJ/GzxxgGNV5LxW+SjnqdEtr5b/KGfHXFMgiR2nwc/5fwXoK8NcVhczzgn75mXFcQZmfd9ILGwEOEtCK24YhlulUQepfQxsGi3XK+5UbqclEP3pUJB3W39ZtftIIz9O5+XGSegdTBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beJU9rE+6TBdsvD84w7/EpKs8AGK0EqJd6BrNdhaeA8=;
 b=QNzi+/DfF2nMTBYNN6mXJjCv1/+/tZAEmuQlyk091/OsvjJDKHHzoLK4AQWnnd7UIoETsoXg0C/dwglMsD+91vBYD0lPcu+yragAszX6YcoIu5eih8woJJViZhpUXRaMB5SMbVCtggGebYe89c71GnVmoGNO8T3iDg828iqp9woGq+xeL5xyIcsrvjcc9zruXE3ltnTMgo/J0UP1uMod8FEZgKQkCE3zjFSm+yb9YLWLmOkpZmAqz10AgEp3PpTSffYXPhs6Lp7WMSEleBcf9oBT3C/1caFwEMVf7wBxzfmIjx8NPZpAby646JjBdTX81xWi3nC9im3DWyfgp+msKA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by BN5PR12MB9539.namprd12.prod.outlook.com (2603:10b6:408:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 09:28:34 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 09:28:33 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 04/11] dt-bindings: usb: Add NVIDIA LSTP USB adapter
Date: Fri, 16 Oct 2026 12:28:14 +0300
Message-ID: <20261016092821.2049721-3-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168490@kernel.org>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-4-aambrozewicz@nvidia.com> <sashiko-outbox-168490@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0069.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::20) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|BN5PR12MB9539:EE_
X-MS-Office365-Filtering-Correlation-Id: 57421539-33d4-4463-4c4b-08df2b67d930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	64m95vXi7JNWJKynd8XYim+skm+Dl48wwPOq5p57ioJTNoyhM1pTXYDg0+COCXNI72afKU5+76oEJVkke15d6SYzYdWj1FsCFk4TQ5wVK8TTewofkKD6aQNp9t3uTgZ8WFfFFUbUiuIe5Z6WpE7Yzcz65dn0TQcHGORR572lPM5xKr69zQBfy5jmZz4hCHEjiXKVbxptDBhKaXVqpuvRPmP6jjiapRRDnhcNNA6RbYSptVEmzNqSOlP6g/4fJ3Ic7Jqh9UyH873VZ06o4e6P/yDMMgNyat3AnSNuJPSFtUExSLJwBV5RFU6hFcXFWkCYvJs+CHxAFJzxlA4VxePnj8tKM9DGybqJkxC09z4QzbBR0NW/gAhvRKzDnVw1/qfjt+9DuwoSAV7YH5O/yPJ+ri+lIHallSYEKnwcWFjFlw7XcDL6iVd8YGCI7Jwt4qZJk0QWqcC3Cny362zq4jBGYvVG1Ic6FbHpol/P8mjdg+MEXItwJoCR+8USgEd/ffJdYNVhrtptlbT3H6+p/yswOh8H5ZpX6ZIJDDk6hH8ki5/rEetsnLZE4QHWRJ3kjNwZzaBC1kKJVcZM0C6g1BjvwHwaEb6aFADj3mPV0h5OeWlGF9BrZ7q0diebXKMM8Pl+NwPQhheNQCm1BK4fRvbknySLu7tMGeyBnZ4Eeyaszsc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1h3hXE5BKD8KbwDKB1Iw+b43p8anbocuRNIWO4f2r1HMYPg5PLibyqoVoqn9?=
 =?us-ascii?Q?6RByZeDc2I1WW8sLyTgg8kcU5zaasJMir5C0+FRzo6bAByYShRGtd73aBdoP?=
 =?us-ascii?Q?cMjQ+OgoIi+g5YxPwjCK9t17IK3NW5M23w/Q9qgDRRMp15jQ2+gr6wHfxBy7?=
 =?us-ascii?Q?dOC6YDDZPbQ1fFfHn1DHKp5sAwYe0tFT6eJ9dqQzrlgpdUyH4q6V87MBe65P?=
 =?us-ascii?Q?jnd3eOCLd5yo8AqPFUj41+qwi96CudX8iXg9XpHysMKvjehK/6ryc7pRpvzT?=
 =?us-ascii?Q?JhYBW+aTJc9cQb8kSDo3F6TMH3WgLlHm1qTHHW8W8C9/WZB6uQqSkMy5u62V?=
 =?us-ascii?Q?SLve6QXHspgxVnogh0PijWCdqjmTlZdE5Q+pzfzGJ1r7lh7XMniUrSnISK8x?=
 =?us-ascii?Q?xKAOa9eQCyQ5HHlXkpgQrT0g+8+zUP0Rfnjffyb3af/4018XeNbX88v+b3O/?=
 =?us-ascii?Q?Y/TVjaCxzCAHMftEcpNQJ2b/o7hU+yPZyAjY5frbDt/qUNKlUpYlGyZ+HuBh?=
 =?us-ascii?Q?0vd1uyQaeuXrTcgq8NMZ/Ar3CSNomL1khYpe6lVkMpX88oDoVfRrNGCC3EWb?=
 =?us-ascii?Q?MBVnnaOFPDxbG9oSt6IlphPRwkVSuQB0f/mMjJWbLfRvjPDYHeRFTX/EmTo8?=
 =?us-ascii?Q?zL9gvG2SefxVNi6nsVTfAZKsZLXXlaC386yd9CxDfHVrtI+eR72kXR1Wk3Ga?=
 =?us-ascii?Q?pCSsg7y1mQQDmtVOXRAPTwkOzihVg3pOHyhzBIhySJc/sSbhSLhNa4oBiUcU?=
 =?us-ascii?Q?QkjTTNAZGkARvHVuB2DT+lTwQetex8b3nQMSXWqXidJ92VOxsEXe3PiVSQZW?=
 =?us-ascii?Q?Voosj9x6IJ7192nQzBB7GQmB2hVfynmO8+webiDUcr7rINxMEBD0HVR7xV0o?=
 =?us-ascii?Q?42IRblkUmaxwJwMu4+8IwxUVcFeIS2RJIc+DhxI2FQerULuuiVHu7fMzV6S9?=
 =?us-ascii?Q?RXLplx7WzDpGB5kdtbyILg/H8mYD5rA0mCr2worIaZDwhwBmPFXOwLtYM5ov?=
 =?us-ascii?Q?/nLfV9T34wXriF1r9FkcH9vIc6vaOrdeJxl26YsPY4pObPFWxUgHMLoFaAYK?=
 =?us-ascii?Q?YUlEA541IvVjkYQmqlPxmGtaZEqo9HjoqE89YN6zUwPwLV/qeXhb4C+GhmHg?=
 =?us-ascii?Q?ugRflkyRtao+o5/A9yfiQYLPGgICExbG8uhLZyN8W3WR3h4xqkB6ccEQMiWq?=
 =?us-ascii?Q?1gfJK1ORGpB1O1eu2y5mGll+XzpvHSfjozhAMDDm9a0+Ubl81JIOMD/zMslU?=
 =?us-ascii?Q?uJyxOIva0xc93wtZuLLCmK3zRmUKjsYsNADtyM0AUWPpK98kxMDzXAP4V+tP?=
 =?us-ascii?Q?MMKrcsuOLJBsN/6gDnIItEgRXEAeOjI1Rj96txeb8eE90aOBka+VUSkfBmQ0?=
 =?us-ascii?Q?CzgXhGmmQxXckfurVJC+gT3Ydj3kQmhcxl2QP8J9CJRtuSh3gUXmJFqoP2T1?=
 =?us-ascii?Q?pW5/vRzlCuHrzrCnxVY89qNrCCjR3nQmlRXTlHWGFX2zHntVWrFNPRbC+kWQ?=
 =?us-ascii?Q?IesyzW5G6lJ4v5F/1hEoFdohB9oqcciC2aY1wWxCYLRwFELGF8vE+pZAF4oF?=
 =?us-ascii?Q?NTI0aS34o6D01dm3fSDXPw2A/SsP73+1s+homzIYdvXfFz5/Avu3HcB+bm1H?=
 =?us-ascii?Q?/OIkVPBA9I+HiyZr0RwVku1KD94GB+frUekmzdz87h3UUufs7JfzJeEG3fHm?=
 =?us-ascii?Q?qUnL2GqxWLCo7xQaU+ayIstKzQAOv6Be9EJ1LwMzL30DHv+cmzMYCinMF8Bc?=
 =?us-ascii?Q?mZem74aqzQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57421539-33d4-4463-4c4b-08df2b67d930
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:28:33.5920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5vUm+Yqrq6yMz+yx0K0hxzqfM/VvGbx5clP++mJHijWfh0oF+dYu60mbg4XqKzmHaEYSpY06FIAYqJj3PU3tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9539

On Mon, Oct 12, 2026 at 05:47:38PM +0000, sashiko-bot@kernel.org wrote:
> Does this example omit the mandatory interrupt controller properties for this
> GPIO variant?

Same point as on patch 1; it will be handled there, together with
Krzysztof's comments on the bindings, once the DT discussion on the
cover letter and in the RFC is settled.

Adrian
