Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012060.outbound.protection.outlook.com [40.107.75.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699B437F739;
	Tue, 11 Aug 2026 06:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428363; cv=fail; b=skcH6QYjM056gnpLlQqgYKTvXMEgWkOB8E9phZV0XPVU+UthW9VYB42VC7ZXUkEtgrnpf0j4bkhbcWrqxlmGOgc5mnJb4cSoStXhG37IPbN4jq5pG8xSBhFyDorWcP6+sts/Iz7K41WPkAy4S9JPVgjpjBe4VOT7QXi5Qqe+jR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428363; c=relaxed/simple;
	bh=81Dj1Cek63c0DgorFqQf0syvQb8DFqlfC2bo9bTW6os=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BGrCJocexttc5ZXRVPKwotpZJhRvK3LMX6pIkF0R7uh55B6ja6bp2mUCpJQIL9zKVr2XgWvfAcna226iCYsOXE/KhTLQR+krGHMgmKHcfD2WQa2KDl4ERaaYLG8az3SNtw6RJ+f57FzcJIn0gM7PMkgPViCN0PE03XfFOwUETnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=gdvNdB7z; arc=fail smtp.client-ip=40.107.75.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="gdvNdB7z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSm+AqkE7hK2C+a3qUfkHreM2cHqGC3FLEFN3Eoh21gh9LRuQZwF68Y12HjjWUT85g0hwL0LKU5zwm/5V7pXoBUAKNc5ARJF5KGmSjTNO/fB2JFMIjSjBsuEz0PW5Do4RGE3RcpVyQBFld3ZSmwTtK+t2tfdWcyteW8D5l0qUs9JvaBaWnBtDqMPuGmxfIsqZ5zts7Q2WAvTXmOHI+FZAKrvFOxYhekxXv+bQyrodmmaGteLjv0L7/ohwLlFk+n1KSlJy5k55JcFncJ5P/ajUYlTy5EuSYYglwrlf3PhT+I5+Sdyfs2f5ZkGg2AUlDB1vInAvq7juTbHWpa/1GOTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtyuSIr3jVFGwhuaDMrRkc3tyO1uLJ7w7sqyf4/xkLc=;
 b=DBCTWgmiy0PAg8lRqnlhjvp1dqPAiI3C5fPXxWN/nYVvvP3bCf3avvFBssNr0pFQMPtt43F25dT5N2CzAAbqfH2xnr8eN43kLtumJzkJewjIUvhB2mH+iYnEtk4t6V6splPFvP7OyuRFWWfYhtoTMHuzAVqFLQRn6mVCWlQh2cUAZWQNqDR5i5tv9Dcy6WtybL26Q625B+KT0JuY/1Y48X1zoT3afwiPh9W1HV5GK/uh76h4FUo8y6NVCjyhRadXJOI92aJjYlTNgGokP7ZnzV5+J8k+d26C6lB7BZUEzZcQqLXIldWwLeV5QIuFtfS418ybHo/qcJnacKI8ph0H8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtyuSIr3jVFGwhuaDMrRkc3tyO1uLJ7w7sqyf4/xkLc=;
 b=gdvNdB7zQLuTx/iR5IVQA78zxWmG+1RL0EAoeEzHSv7EDwja6Yj2yk/njqMoxqhvrrQ6if4mscuO01Mr9Ik6d6RkK6Kaq3Gvq2K++rBP1Zi426dc782tJn837OsU/fzumKyg2WtGbN1hp0JBRhYh09gYINGXN1uHM4A8zbZF4nw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYZPR01MB4211.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1c4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:05:55 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:05:54 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: FangpingFP.Cheng@moxa.com,
	Epson.Chiang@moxa.com,
	EddieSY.Lin@moxa.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v3 0/6] USB: serial: mxuport: add MUX50U support and updates
Date: Tue, 11 Aug 2026 14:04:55 +0800
Message-ID: <20260811060501.2307836-1-crescentcy.hsieh@moxa.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To PUZPR01MB5405.apcprd01.prod.exchangelabs.com (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TYZPR01MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: 05df90d1-96dc-476b-3b81-08def76e99dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|10067099003|56012099006|6133799003|3023799007|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	203JOAoRFt8hnr21mmZBamz5F4pZGJEwjtU702r129YdMIrWRy1mFQwMhpjCNJRGsBPOnN7SE/8g5CBHZWG1l9lcXtplzL1j2/TcJDh3sPfZbFOw02meF6Sk6pUBbh9wKGCO+mpgy3hDFO5h276hHi/YcZK29bG7whfPkTI8p0pnnqvZ+xC8rDnLmXDttCMd1V2i4QfSRcM7Ep9NtClNejbz0gXNE44dmhqD5UNmxH6//ZsbO5/gfpintsyUvP3IYBSLrue2WbDyeBYmvRS5629wlHQI+sBxL9AnEnkhUXiYcu4DIgS3W+jfG+mUUCt4euV4n28vXqPe3heoys6blekpTVELhNfd+wdFKLmddMmG2ZMlKE9EhUlpAQmRiD8SPZMRvsOsjzd1wBsbFwp5jaPpvrFTqWN4JN/U43PYubroeMzS5kKXDFuuuQ5A5aTM0ZV9KWtgNwYMZJrnGfAF2JXnmGnA0q3RHq2YhbS+JHXPERpJC/8J37Q8FW8zFfpKPsDS/e/E8l3fQ6JqRcL4cFzaBCuuFyjz1bA5qaRxXfXj00YnAq8IwtI12o1dr/KwK9cSGnjz+1MR1U2TbpBeKGmF/w5o8qKSM7KjUDsKZc6PJeqN9wdv+BfMU4XqwGerNTLux+fk7yQNGvOghDh55FIoqmZJHp9oxw5vFB2Xs8oPoTT6BSi3Lv2IDBllMjWCvdqzjsBMzNHu0ezctiNZ6mTt1ZIyltPhv7h/FUCM914=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(3023799007)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PodRLwqYcT/v2vPped9fbxUQBkHOZXFjU0RD9UXnT5CfyQH6mJAvACfHHLY6?=
 =?us-ascii?Q?8qGF2TApXypYrfcXfKV0onv9waCai7kLGrCgnizaHhlo9M+Qy9+KTCqd1xyB?=
 =?us-ascii?Q?Db+76WvX5dvfjRmVgcHK7Jm75WzomDd1J1zrLB8xMo2jDGSGXk3NL2ooFu7n?=
 =?us-ascii?Q?r8Luy15gS+mrGvvi1xEGeFozP85oOTSLVS6LnpE9ynebAoaUzHnBkKHsfD3z?=
 =?us-ascii?Q?tZJL6Dxu6LiOinwKZ0WjJwG6r9BhAo8gdWiwz2X0dXEYYvKq+nCYCe+88dRf?=
 =?us-ascii?Q?0UQmICofYOfS395q3biNlRn9iUWSWlFOcG/GRO9L4t16O0iXwRCIR//Mu2aq?=
 =?us-ascii?Q?eFMUPKaLY+9JIcPKEBs2+Lj8Q72IMkCORwAnktoWpDBGBTLQkeJjxc4wLIVs?=
 =?us-ascii?Q?Xjny35Pd3UfYkfvGbQVvyrUwrC66OEoiNH6kYRy8IV1Y4b/zCnAN/dEJmLij?=
 =?us-ascii?Q?31ysuvSUbuaIE///XJzbZJZxuv3toIJ7v49mDPbyzUORv4gniS397kQrJduQ?=
 =?us-ascii?Q?mSTq0lljA5VewETOSR6ljaWbeii88sNuzZJ7ifBDtEjGGxGrZPwyQXTIPYP3?=
 =?us-ascii?Q?VpZvIsgHyVz9AghnihWKt2d+JnuL1Q7dnCF2PKSyysI35v/OF99eFttRh4q8?=
 =?us-ascii?Q?TbrPsHRVcUbiaAnx+mTyjNqypCuXL43mTaC0fMxzIAZdr1AH7dafLFQVBt6a?=
 =?us-ascii?Q?yxvF5yXAM5ogSmhG7XdcAofUo4kjc5mGGA65SCWSlnKwQ5Gd42vHNecgZ1eb?=
 =?us-ascii?Q?m/qgR2Av4doLF55lgH4cNAdzaGY7qxqYttisKcLpR3KyJHZa2gORDIB99Z/d?=
 =?us-ascii?Q?q4VcZcs3yWdu9gy1kBreRtmxjcEp4UuMH9V3IgJ6oLY29KXuIwKv3Y2s2XdZ?=
 =?us-ascii?Q?f5q7emUQMKQjbn7N1SKYkK8rBi1RNax+V5Zhl26xcAAahHxLoRt+CPozSwJQ?=
 =?us-ascii?Q?bhj5ny1LLIqqAXlh0qDpo6KA3WkfvS1ZoanCT/aRgO6eAUaxT7ITg9eqqCRb?=
 =?us-ascii?Q?TGEpxLvYSK8Q+/v29vBIP2sgzDiheY+57Py5vPM4AF1C36CnvJ6kc1ajaqfV?=
 =?us-ascii?Q?GbmDl3PW6vtYg6vIzplDhC+4fZF56LyHupCKI/Ey2H9Y/yBWj9qB/yqBCsN3?=
 =?us-ascii?Q?+6i+aQxS/S+mTYdqaO39MI3mc4IMxbdDeEJhu/K1MbINq0Iz6oMAHGHXHZE3?=
 =?us-ascii?Q?3thR6AZ+sfIGrfbkpaNR0TNMXExee0NeUMR341f3cI68xV8OEGoOPMMEj6Ni?=
 =?us-ascii?Q?QuYFsfO4aFUe3R/AgLkMIcc92mqncKDGC3TYcyh7VueXfnVmjbRmpTHsDCh0?=
 =?us-ascii?Q?rtap2LgaI+F3DjGtu8ZkL4JWRA3eWygcvnUZ6Dhqktlut2MPxIMH2vaFCgMt?=
 =?us-ascii?Q?hybtOh33YC6Hr3l6n4lmSl4DDbrVqoS/ZF8S3HD/cCFEp9ne1WmAzRPnWK5x?=
 =?us-ascii?Q?Tnl+UH97Xcz9NASSzHjgSDJoR9o9a+y8loNeKO/BV+YQlKtZjdt7cCQNRuyu?=
 =?us-ascii?Q?M4FmqRezrlHWHOk+g8tRJunN4ogzbZ0e3qeG2t189YhEUy+qUX8n9Lys0DgQ?=
 =?us-ascii?Q?7HxVwOSK3OIYa3yOvecbRX/TDboGBkLi/AAV5+PlRXGSQFVsiIbeg8KvjZAM?=
 =?us-ascii?Q?ZEbv9+dayuFfp1b/EmBSWvaxvVn5otuuCxkxvIaS7lJ67ePrW8mj7GsCWRuY?=
 =?us-ascii?Q?MjLa7SndlLV1Xw1J8C6nVF3VHdMvdN62z7k0nhPvPY6iPckSqEWLbYaIyI50?=
 =?us-ascii?Q?fdEa/iAsTLQLyVncxWsXxToyk1jkYfw=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05df90d1-96dc-476b-3b81-08def76e99dd
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:05:54.6680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lS6+MRTA2lGq4Pp990EVALFGeux8Sk4zxNTu48K0s9zzoeMYG/+LUCbaFAveVd6uRIDLBrVF2hA5SM+aUIocq17tKFE7Kj18ge5KEIutyLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4211

This series updates the mxuport driver to support MUX50U-based devices
and fixes device-specific runtime behaviours.

The first three patches clean up the USB device ID table and firmware
version handling, and add support for UPort G2 and Platform UART
devices. The device family is encoded in the USB device ID table so
that the table provides both the port count and the information needed
for firmware handling.

The fourth patch adds optional callbacks to the generic USB-serial
write path so that drivers can stop write submission based on
device-specific state and restore that state if URB submission fails.

The fifth patch uses these callbacks to implement the per-port
SEND_NEXT transmit flow-control protocol without duplicating the
generic write implementation.

The sixth patch adds RS485 mode configuration through the standard
TIOCSRS485/TIOCGRS485 interface.

---
Changes in v3:
  - [PATCH v3 1/6]:
    Rename the existing PID definitions after their corresponding
    products and introduce a helper to keep each USB device ID table
    entry on one line.
  - [PATCH v3 2/6]:
    Rename the firmware-version composition helper and retain the
    existing firmware image-size validation.
  - [PATCH v3 3/6]:
    Name the new PID definitions after their corresponding products,
    list all supported products by device family, rename the family
    definitions to describe device rather than firmware families, and
    use BIT() for the nonzero family values.
  - [PATCH v3 4/6] and [PATCH v3 5/6]:
    Replace the mxuport-specific copies of the generic write path with
    optional write_ready() and write_rollback() callbacks. Use the
    callbacks to pause SEND_NEXT writes and restore the per-port state
    if URB submission fails. Expand the SEND_NEXT commit message to
    describe the per-port protocol.

Changes in v2:
  - [PATCH v1 1/4]:
    Split into [PATCH v2 1/4] and [PATCH v2 2/4]. Clean up firmware
    version parsing and printing in the first patch, and move MUX50U
    device support to the second patch. Encode the firmware family in
    the USB device-id table and use the system-register remap state for
    the MUX50U firmware download decision.
  - [PATCH v1 2/4]:
    Moved to [PATCH v2 3/4]. Add mxuport-specific write(),
    write_start(), and write_bulk_callback() paths so SEND_NEXT can stop
    and resume transmission without returning zero from
    prepare_write_buffer().
    Drop the open-time FIFO flush.
  - [PATCH v1 3/4]:
    Moved to [PATCH v2 4/4]. Clear unsupported serial_rs485 flags and
    fields, cache the sanitized configuration, and protect it with the
    per-port mutex.
  - [PATCH v1 4/4]:
    Drop the UART FIFO sysfs interface from this revision.

v2: https://lore.kernel.org/all/20260623080138.166398-2-crescentcy.hsieh@moxa.com/
v1: https://lore.kernel.org/all/20260324035041.352190-1-crescentcy.hsieh@moxa.com/

Crescent Hsieh (6):
  USB: serial: mxuport: clean up product ID definitions and device table
  USB: serial: mxuport: clean up firmware version handling
  USB: serial: mxuport: add MUX50U-based device support
  USB: serial: add generic write control callbacks
  USB: serial: mxuport: handle SEND_NEXT transmit flow control
  USB: serial: mxuport: support RS485 mode configuration

 drivers/usb/serial/generic.c |  12 +-
 drivers/usb/serial/mxuport.c | 424 ++++++++++++++++++++++++++++++-----
 include/linux/usb/serial.h   |   9 +-
 3 files changed, 378 insertions(+), 67 deletions(-)

-- 
2.53.0

