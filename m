Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023072.outbound.protection.outlook.com [52.101.127.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4447E345CAF;
	Mon, 22 Jun 2026 07:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113951; cv=fail; b=ukYqip2RJi8zMcG0j/MYomqF8d8m5nGXOSimUoaXNL604F+xui4yjcLJnPfXikCfoEdM2ML3OUXnIH6HbBn5345cLDEQ2zL56bto5/5drB7QVtaiXUrGpmyixeOVqDY4jhQFKk/b/Dade1rvE4HkC3ubxbmkHqs54uE4fQ7Kq34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113951; c=relaxed/simple;
	bh=JRzWHg25TX3Zouv1Vp50owUum06/pziq/hls9a/LtUA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GOE1qLUCBrG4qZZyEBgOJOk5keR/fWbJBudk4jrQX/dXGYGQGk3NnJ2Vu9ZnHbVKcqRcEj2+bl+/Osnu5yjqYhRP3kC9qDvMUAqrpD/eeEoat6INMmH0DQ+NMQfno/wk0/OgdgrX+4LqaG/zeAafU3H8dxnMgsyV04gXL7sL7Tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=B8egxmBe; arc=fail smtp.client-ip=52.101.127.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="B8egxmBe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDV9r0+Cv+d5dlWHxzOCkAlOVFSFXe5qWJM+npGn7VZIlU4QdpHpMBb54Zi3X1TGrsgz3eyirkMIzE0Bzz4TeScJKt01j5O7cCeFgJWLP8Ry55n1cd4T8geWYpyqZxSCc5xfkWFLRG1cQLTX9QPkJCvtqhy6rlCziP9hCLpsLsQy118VMzNN+wuh/IRDxzB2cQRwcJ6DQy0qkvatY6IfKCKy+f2cOJOQzFyvCJPZ1ri/kH+UxVpTP+UWDHJ3bnuW9WLNFBBbRSOsJCQequ/8/b76y05/RMD3QRwsS1JWr3WxK4yWX29pSBluoXD04Qnmx/si9C0hXs5iBptRwORxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SufNMwuOIVn974kKR8DmTGWg64ZR2EpqQ44Z/2G7ddU=;
 b=oQ3n2g8khtYiT2vnbYVill4Blasv6pwCJLVW1mH5E6Hs2QoNUxI2tfv+RTA6GQ4QkTj5Mau2V7H6fE6Jk8prqIVQpFZhwpp7D+26H1HF0X5Zg0fVxH7lakLPhwMDfHoP0TXo8A/1HYelUfflL/fE1ufsfP3fLXtv7hkDXn4lBsr5E4KEM+tuIHBUYL3Vypp8GcXMCKOGzf8zTQPu6GEYAgxbZkckaESu85V38lmhV99xpZdxbpaoJyzYeLyYxZAgyIgKEvclEiCf46qjG8sRdQXGg2PAlVVRbGxQ6qQScPE38K1hBRln9s7g8Po35TLctErXMfs31MhJU+goiJw/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SufNMwuOIVn974kKR8DmTGWg64ZR2EpqQ44Z/2G7ddU=;
 b=B8egxmBeksxB8l89ekD2kheJrqK+Pp8G/C84e/cOpt6WdRnUWCa2J9yIdsXR5VtJDYNyW9K9jYkv9J8p+kFNlpgGctt/NFPX0dWNwlOZdHkyEYaxWV16K5bLKQP82aEuVVjoIF3bocMcAdRdmX0k7wmzUooR0+I0nvhuRkyInDeO4JZbvC70y3wl1BhbEi+dnTls7dZXUBUDjaoCiz9O+LfznD8IXJrrtUQBuvfKOJHjGoGP3xIEILv8qFZ3CXp4iJUcAapkF8sircog92uPU1JXGdGz11t0T10hRq4t1nFfUUx/E/Z1bPKEhQDq0XlbshpO8huOu3pIzBQRNiKYhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by TY0PR0101MB4383.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Mon, 22 Jun
 2026 07:39:07 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 07:39:07 +0000
From: Chinna Mopurigari Naveen Kumar Reddy <naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arun Pappan <arun.pappan@ftdichip.com>
Subject: [PATCH 0/6] USB: serial: ftdi_sio: configurable read-URB defer, per-port low_latency, latency_timer reliability
Date: Mon, 22 Jun 2026 15:38:33 +0800
Message-ID: <cover.1781744946.git.naveen.reddy@ftdichip.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::15) To SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PPFE985372F0:EE_|TY0PR0101MB4383:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c19ea9-eb90-42df-c65e-08ded0315747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|38350700014|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	K3Lxo/EmXsfSeECQ8xPeTnUJvCduwqchWzioYIrnzoEodGsJYy00UlNaCMQ7pSpsqDelPNKqK10XxRI5uoxl3tgzEQMSECjzvHV3xO3ME417rLW1PMMLB8EE6J/fFRoH3lt4PhfG+jl5REmrpHtUn7JPz7SDSZjIBWIIPjUm1e4i+KvjdOxo/qSu+c50vWso28UmXakg5rFnC/5fbmgOSVCL/FlIkW8jnsr+qU59lzreiGRfoHsUMtFnWpyzSJ+eET9MIskZXdtZhv6JQSoeD8gi7Ogwu1pCi0zXeutbtlfY6yJzg8gDyeemvDgMvpYyrxYmMDrcnV7rCThMZlF/m53dB6CIuvxHeE7nFf1eg0fVct252VMbPhO1R1qhVaXq01SrNvAKY4mdRBwRGhVS6r7d2IuaTUGfhaXCqZn6Fjt6Y/97C2gMg/FQkVLryUn8pmJ3KInQNdhYChlwOT5mJXA/J3DimbiU9J55NlO7D8mA5ylQV75mABZFF1Qdfm7jet+NQHqm7WUYBI4pDtiygb3+GaPIP6BM6rGc9nNrqFD16xuhXxiSUgxAnkiD7SBGfQlp3cmfNMdtkF56Jl5RJpWW6jJghvRYaHdSjlx3SMJ6QecX96h5UbdQtdZCADjGdWPpVuk/Gmzq75HJr0ccooSmAs4wGOg9bgbSZg5QLwFzRkKyV3zDF+arIrb1c72fNh1nfkde3x+0XHyV7EeNetz2lnrVGZ4R7pqU6IfJ6R0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(38350700014)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+jm+uBWcC0W+19ydtX20IYVKBJYezN/Fav6S7q16Fzk9vv28AWWJ4GEf9s1L?=
 =?us-ascii?Q?u/mErw9rO31tz1ZHyEukeOwlMlcjk/OmBv6dBoZ+VSFLKuhMLbrUNMre8caV?=
 =?us-ascii?Q?AXJCypF85cESf5zIoyXEjvqj1bmDovvXjJkXtF5NDRK8/8ibVi7+I866cFxC?=
 =?us-ascii?Q?25DfsNJBx901eCymzu3Z43njFiXNE1UWhwCw98eJz3ZoiNUo4W9lprdzxaGH?=
 =?us-ascii?Q?69IRcDsDg/R0fAd+F0qMFznGAJso7vKKVsxZ4ACPeiLzhuLUuMaIwXP7Zdbs?=
 =?us-ascii?Q?8Xa1klOeKMQRCXOhWRp9pCeoziPGeMST0DU7dsXtcrEd2CT2iXadim+kP8ci?=
 =?us-ascii?Q?4pDRPsRE69VcsKNoiBW+PUcNpT0GxVw90TQp2Slcl3KSxuTTnNNHyQemZfOv?=
 =?us-ascii?Q?QuKj23JIHJCRQ8V7TG8/OUMMmn4NLQDxmZfZRtZweMoaYEfKkN1MvWhDzCwG?=
 =?us-ascii?Q?KK3YvruO9RYKs+rFkTcumSNXQdRaUkMnJdV+q/xCkbcgprrlcu0sItl8cHm5?=
 =?us-ascii?Q?O90+hyJwW9kgqvA0FmGHhTAI3DKDHvhsjgcBFgOhwPFcPNkKz/feK0PHneBg?=
 =?us-ascii?Q?sKY834nxcXLNc4XPV+0Myjm9gQAy34N2jbXjLnBKd8L4N9BuNzakAiPXA4r4?=
 =?us-ascii?Q?mFQBknQ9QeiSPdVBBbQsKJtNPX1E8NjfxbJ9m8CjRbk/qbAPi8pSelyaRQSY?=
 =?us-ascii?Q?aumprEVygqZHuru/RHZQoAzTPCBsFhcYtmSmsRanQ7sZib3K4g+S32hiQmxV?=
 =?us-ascii?Q?LGIyNxzXE42CmT4CS1Gf+nPG8AGOsFo2Q0H3VNoj4v/sHdy65212byUlY3nE?=
 =?us-ascii?Q?EEIoZoLSTxq/LkTc9TSi/oxacA+e29mjsl+sTUiSWQJc/OhFZbgYdE7MAjDt?=
 =?us-ascii?Q?ILzo7bRKKZGEJBukX3peSzWDzPr55p2KB6wmymmHhmtt1ok2aGVfMOJjeHfk?=
 =?us-ascii?Q?weVUNwMjWfva6LNhQu31UnWx78fdRyR2VA6Og3S9dnli4xAa6nnAPbJJ426h?=
 =?us-ascii?Q?KzHIB7M4Tl8J44S9xRDgNigLaj4Z46AWfm8or1s9AWEO+PuCY+m23ELmoIOg?=
 =?us-ascii?Q?MZrIs9wiMyow8zGMwiLb89T8BGgaxuDFHHPeLUTc0M3TTHeFFGHCLcoPVjjZ?=
 =?us-ascii?Q?mt5VNxQ8IqWHWiEd3Dibq+p4hFhe1H5Blb0txOJ45PiVr2rN2mzOtL2C2fql?=
 =?us-ascii?Q?MOaypVZZNUd3k6pS6+IO5LcbjhbJpXU68guGM03uJCmJdX2tzf0PTW/gEPma?=
 =?us-ascii?Q?+FYdZmKD/qJj2T8G6WSBWdJd95No6fyOXO+MdYFKy2fo171VzWuZ5kk4XTIh?=
 =?us-ascii?Q?EUo7D6RHoazb2M9pw15li4M4ng0mw7ap6ZGBKVH1J0HoGYAR2d/o9qilS5eA?=
 =?us-ascii?Q?U8iVNck5hbLwnpVCmGucz2iBH+AxJPphJTMz1B4eGiOsOwU0yGn4hLeVs0Dw?=
 =?us-ascii?Q?UJ5Qf4BPvIKTYtCS4SFmov2aFNOrlsAnR8JfSsFXc2kFyneiH8lI8Zw2bpre?=
 =?us-ascii?Q?tIpH45fan6lJ/7WmiIWxc4EY0T1kTmOlardN4Xsr0vZH+cfGsadhMMx7JOD7?=
 =?us-ascii?Q?k6LGt4pp/4Zh7I4VvyuiFhaVB/PGc63861kq1uGrMjxPhlYQOgId8nne2M/m?=
 =?us-ascii?Q?G3bfAGi432MCvjOWCw+EXMVoVRZpS3oTS7F8UjG5mr6/pb1N0C7ZuE/x5Imh?=
 =?us-ascii?Q?h5wxsw9gDM3st5wait1q1vbf/1+x9eK1xg2nEejlG8j57XY/7TbpvsYkxkKd?=
 =?us-ascii?Q?ojVG5hzEZJUB+kKLTy5kwgCXzdfrL40=3D?=
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c19ea9-eb90-42df-c65e-08ded0315747
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 07:39:07.1002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9bq1Pz1EEI/bUwDPuiaNskbSrEXpgIq7U5mbjD4N8ya14Q/0O4AJ51SvwlM2+hXuwO28KfzMD+XmORV+YvV6jr6ISWgYUOEniXrD3mNqBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4383

This series adds an opt-in mechanism to bound ftdi_sio's read-URB
resubmission rate, a per-port escape hatch for it, and two small
reliability fixes to the existing latency_timer sysfs attribute.  None
of it changes the driver's default behaviour.

Background
==========

ftdi_sio resubmits read URBs as fast as the previous URB completes.
On host controllers that do not arbitrate DMA-channel allocation
between devices, a single FT4232 at high baud (4 channels x ~916 kbps)
can keep most or all of the controller's DMA channels occupied;
multiple FT4232 chips on the same bus exhaust them entirely.  The
control endpoint and unrelated devices on the same bus then make no
progress -- device enumeration fails, hub events stall.  The
BCM2835/BCM2837 DWC_OTG controller used on the Raspberry Pi Compute
Module 3 is the platform where this was characterised.

This series introduces a small inter-batch defer on read-URB
resubmission that bounds per-device DMA-channel occupancy.  It is
disabled by default; behaviour on every unaffected host is unchanged.

Series layout
=============

Patch 1 adds the inter-batch defer and the urb_defer_timer_ns module
parameter that controls it (default 0 = disabled).  It also adds a
small helper, ftdi_atomic_submit_read_urbs(), used wherever read URBs
are resubmitted from completion or hrtimer (atomic) context:
usb_serial_generic_submit_read_urbs() looks atomic-usable because it
takes a gfp_t, but its error-recovery path calls usb_kill_urb(), which
sleeps -- so a failed inner submit under bus pressure would sleep in
atomic context.  The helper submits each URB inline with
usb_submit_urb(GFP_ATOMIC), which does not sleep.

Patch 2 wraps usb_control_msg() with a retry on the documented
transient errno values (-ETIMEDOUT, -EPIPE, -EPROTO) seen under heavy
bus pressure, and converts write_latency_timer() to use it.

Patch 3 makes an explicit sysfs write to .../latency_timer
authoritative against the legacy ASYNC_LOW_LATENCY tty-flag clamp set
via TIOCSSERIAL by tools such as setserial(8).

Patch 4 adds a per-port low_latency sysfs attribute that bypasses the
inter-batch defer on a single port when the defer is globally enabled.

Patch 5 serialises the low_latency toggle against the read-bulk
callback so the attribute can be flipped while a port is actively
reading or writing.

Patch 6 adds a low_latency_defer_ns module parameter: instead of fully
bypassing the defer, a low_latency port can be paced with a small
per-port interval (e.g. 2 ms), which lets several low_latency ports
run concurrently without re-starving control transfers.

Testing
=======

Functionally validated on the affected hardware (Raspberry Pi Compute
Module 3, BCM2837 DWC_OTG, two FT4232 chips, eight RS485 channels at
916 kbps each) on the 6.12 stable kernel: with the defer enabled,
worst-case control-transfer latency under concurrent load dropped from
~50 ms (stock) to ~1 ms; per-port low_latency restores native read
latency on a chosen port; the paced path (low_latency_defer_ns=2ms)
lets four low_latency ports run without starving control transfers or
the USB-Ethernet path.

Runtime-tested on mainline at the series base (arm64, Raspberry Pi 4,
VL805 xHCI host, CONFIG_DEBUG_ATOMIC_SLEEP=y): module load/unload,
default-path loopback regression check, the deferred-resubmit path
(urb_defer_timer_ns=30ms) with live data, low_latency toggling under
load (200 cycles, no stall), explicit latency_timer writes, the paced
low_latency path (low_latency_defer_ns=2ms), and 50x open/close churn
-- all pass with no atomic-context splats.  Note this host does not
reproduce the DMA-starvation problem (that requires the DWC_OTG
controller); the mainline run is functional validation of the new
code paths.

scripts/checkpatch.pl --strict is clean on every patch.

Chinna Mopurigari Naveen Kumar Reddy (6):
  USB: serial: ftdi_sio: add configurable inter-batch defer for read
    URBs
  USB: serial: ftdi_sio: retry transient errors on chip-side control
    transfers
  USB: serial: ftdi_sio: make explicit latency_timer sysfs write
    authoritative
  USB: serial: ftdi_sio: add per-port low_latency sysfs attribute
  USB: serial: ftdi_sio: serialise low_latency toggle against
    read_bulk_callback
  USB: serial: ftdi_sio: pace low_latency ports with
    low_latency_defer_ns

 drivers/usb/serial/ftdi_sio.c | 488 +++++++++++++++++++++++++++++++++-
 1 file changed, 480 insertions(+), 8 deletions(-)


base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
-- 
2.43.0

