Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010019.outbound.protection.outlook.com [52.101.56.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F897274FD1;
	Tue, 25 Aug 2026 03:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787627046; cv=fail; b=tYkGNnJ9TAMQVFGJPOCbQPVGw3o6iQa+/PePo1TDsWJHuyOmaXKJkNCaeaimKdS1850XTiprGueC1vpRegAGkRKpCnKvg+ITHTo/jbOBdzjjzS0F0WXOgH5UHFh7rtb9lSCbRbjXhFzJ8Xzmc5o36v0L4k7ToEKQyF1whfNvr18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787627046; c=relaxed/simple;
	bh=hQTV6t4zlKISMQk70tTCeXozEZnhJ8Geaw18KNqERl4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=eqy09j9jVxGoauyXJZW0lC2duSHWc7UKMZJP0sDVu+QEX6s6psJcOLQeF+b84xSkF0o7XpfD5KO9dxOk5il48eo2YyB40rUMQeSPNkyvzklsbv7ZSbgYlaix+kMfPyb3ivXbGAmZ0MJunq3KWy1LEsC7vEfJn5oAnM6bnugJ6qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AhlS7SCs; arc=fail smtp.client-ip=52.101.56.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AhlS7SCs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJBxTdcrfdu3cJS13vvSzyOWN6VdklJbu5W23e1vjDz7U35Hou3aTEtOmo5UTSt4pJF0NARpQsnv+V0nlZ/kfsRO44A4CDiY4VFyS21zCvQKV4BLrYV1Vt1tyBqh4t4NkGMJLIyHGbgaE53ciRnVCYwWGWqViyDG1mh1Bps8EkD26bF8uk9JlzfJoXwlSzjoXCGN5MulWC35n/ul/CzX3eQk8ukClmV17oKVx3IsxJmcdpf5ZjCIdUSk6+3KBU9GdCj525x6h6xapFw8Bx0Cl0sELeU5XssFCUqzbYK1XaOVuuYpTISyuJK+/pmAgL2SCwPf+hfmIkQSxx2c9sBalA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGr1JXS8wpipC1fVnRJE7fZfAdRhrITick7vDjw/vS8=;
 b=uj0sSjttyu23aI8V7MV/39eXs1L84agM7JMefrCvMePOyS49spnV1V5IJiY6k09qh3krqfP5L4gU/gpJhDw6Cs8OUtdKLI+XyBy6r5jCX+9pqYtXPjeGepWhafbzEch6B+zWr2a94NaMSVP4pgNDAq8fES6QhQrd6D9aPUK3hP/PyT09ATKzRk6XrirWrdD2nGnJWZta2M/cvlEXH35gA/l0RpuEoC52nJxYsLwvywAv99NZ/HsmJ9wKEHXk3CKx8JJB65QD0WiwjdvLoIZqT8Hep2R2xB42DRI4aEArPK157A/Om7WBuI3iHjGv+pzUUDvFbtiJwSmjMqdwqPDLYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGr1JXS8wpipC1fVnRJE7fZfAdRhrITick7vDjw/vS8=;
 b=AhlS7SCslSZwyL3vLNe89LIIyqSwjRSaF1SDI4Dqi2PckN7zuMotOsw6mElSLUUrLLaE5Lj1c3Jee+BxQN5sR6ewq1KKI0rcz1pBKm0NYjwphbAK+t1BsBRlTVJUD+46mvM//PQwRB/LKy6Pjlcn6T0XbJTS+RzE9C4B1z3tDDE=
Received: from DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) by
 MN0PR12MB6151.namprd12.prod.outlook.com (2603:10b6:208:3c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 03:04:01 +0000
Received: from DM4PR12MB6134.namprd12.prod.outlook.com
 ([fe80::3db6:cf8a:e0d5:e8ed]) by DM4PR12MB6134.namprd12.prod.outlook.com
 ([fe80::3db6:cf8a:e0d5:e8ed%6]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 03:03:59 +0000
From: "Martinez, Juan" <Juan.Martinez@amd.com>
To: "westeri@kernel.org" <westeri@kernel.org>
CC: "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] thunderbolt: Fix deadlock in tb_domain_reset_interface()
 during hot-unplug
Thread-Topic: [PATCH] thunderbolt: Fix deadlock in tb_domain_reset_interface()
 during hot-unplug
Thread-Index: AQHdND2w5mY+ZSCtYkqs7TW2BgBW/Q==
Date: Tue, 25 Aug 2026 03:03:59 +0000
Message-ID:
 <DM4PR12MB6134B3493ED0534463F86496F1AF2@DM4PR12MB6134.namprd12.prod.outlook.com>
Accept-Language: en-US, es-CU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-08-25T03:03:58.737Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6134:EE_|MN0PR12MB6151:EE_
x-ms-office365-filtering-correlation-id: e3ddba92-039e-4cbf-337a-08df0255824f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|11063799006|56012099006|38070700021|6133799003|10067099003;
x-microsoft-antispam-message-info:
 dQ+7xz0ygDU9AK6KwbpejVvexPL1s0WNrdzjPSAEpHCWAjcqJQ171a4LTte6rBtS1Oi8XnPPQLuMThuIbOQ0rbBcMNlEjI+DX/7mhEkSRKtRffgUGu/QhtxQ8bFI2Cjl23X8qkb02f/2zO9bJxuwETMYWYRRwelkGDTuMYBtmrro10sO+i17tRRJ+4GMPfT/XSvfi6cDp1SfPbdgtE01+DstmaOniFe8MgLMkm6pNK3K3ElKaNusFvObl0SoeeNca172ad+HFUWGMrUuFqfHncMC8O2dfJiNST8+3T9fwz+lW6mhm8IEMUjPGl5r9rGR5w/SPqJZCaKKBYBlU/smdgSPDtu4puVuwlit4YfIC6g9pa8c6rtfeV0IXCvIoocEuqqA5y3lPHbUoe/HL5f6fTYa0RMqiUBv7EFUbdauUsZi5YjcoDZcXRuRx+dnTEvoZYiYUcBraJJOx0U1QE/UvHl/8WAOh9k5eR1hvljmGNKcMEWs411iGfjh6GbZQIlqkqvVq7iGzbUDGGjrUBFSsPmtKLJSKsapq9Lw8JJcfHQM/qBRef8mYya4RHR38ikWt07f8vwalQK195wWpodHkI+ymIZEdE7iS97jHsKLjG1pzHmhFvU9JCns/y3Z+CfYkJnMJiKoEGQczifEC/o6ZjAyUyIYV69tG7R4wKEZekVSssiGohwDX/b6ruShMUHnTKNRu41dTwUtxQupq+OBp1viWqYLLF/lx8FXTf8LTco=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6134.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(11063799006)(56012099006)(38070700021)(6133799003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qb/4vS054cDgrlXC+a0HtO9qrYd/fiDGM2LqxXX6YpVYQ7u0438sApdg5X?=
 =?iso-8859-1?Q?p9zuKJK5mT+a/LA86W5DrIbeW9SmFVUInu6IGk/jGUFjb5b7ExTL+gkeIk?=
 =?iso-8859-1?Q?djiRsI50ONtyyCivBbXBRYC3D2uHkrJhqX+/lyUN+/9kY99IMCxyEtorfJ?=
 =?iso-8859-1?Q?Rg5s8Z/Vyg08VM+hNdplQYZ3U2cetisbh8PbfmVRkqCHBikzirc8xGTUAW?=
 =?iso-8859-1?Q?p63CSKl+IycJ58nV/jv97c0guqRw7zqtBUEXrsEiHBN/sffSuI80JuvpYs?=
 =?iso-8859-1?Q?ckdpdkyV9qXLE9l18kpSjIaeazho5WDLneCYd+SsCJDOk/BDJjjBILKE5J?=
 =?iso-8859-1?Q?bD1KdYp9+AicTtRkvGfLNYi710Sfgn+0bSYHfageqnDDET1Jwrs9rtUy9v?=
 =?iso-8859-1?Q?IXhPKWUlmVTeJhehh7SEsgN/hqS1/lOAXrvZmfe9ThxoCsv1XsR98qKHBG?=
 =?iso-8859-1?Q?cqzqXyOIKI5JDwvki75OB+3CKHptH+fbMccisJKreKbEelXh1qsD9P9uqg?=
 =?iso-8859-1?Q?sx9qub9c3FPM7FD8hccf2l7lP9k60xH6Olazz9e0sVkM98OTkRfYUkLU77?=
 =?iso-8859-1?Q?PE3nMdddhZ+NHOwSbNSCnYOpfUKCe2HwaRk91O3un624BPlbBW7X2PSZNx?=
 =?iso-8859-1?Q?OREqV6oIWzdtkS0uptCUdgtIUCnhWmowd0wSZd9CgAxpkaCESfg2ZwwqEu?=
 =?iso-8859-1?Q?XjHbI4Qq4hJRvmgV+TsbjvAqnM/j6cxSE4ocXt2S/dV3TiV8oJ8E1sQTH5?=
 =?iso-8859-1?Q?MV303r7YsmAPRMh208cGHuyuGyupGjlscn3kRZpEbJ0Ml1M3yEiPEJSas8?=
 =?iso-8859-1?Q?c1c2IV55a1X4o0Q0Fb+NPupcPcHrRyc5HwXEnnAJZ/tO5ka2McxPpuMKWY?=
 =?iso-8859-1?Q?6Rj1GLmJ58RDaew3byojtivSGaEU5zOS6YEJY29GHA9FKgh3rCZ4kk3aqt?=
 =?iso-8859-1?Q?C8VpOiE54FZwBJNmWvvdGhuAYCwI3AsDnWbkQ1uztTtMCAwr1zH1rOfVWy?=
 =?iso-8859-1?Q?6Q7fpRLGFV09wcK7iYtsiAxaYv8WnH9Kwzflt62IZu+C8GGeU55eWAqFBJ?=
 =?iso-8859-1?Q?4gd/OMOcmKMKQu6lHg70fQ5lw1YoLfZzhH7hRR+CJCgJR2seS/tVzf3EGI?=
 =?iso-8859-1?Q?Lo+D56TMtz/dmxqrWLt/YRB7kec9XmXt7K/DkNzj9aX5HU2BMbdNC0sY0N?=
 =?iso-8859-1?Q?3Cr4EptIAmEv1WCQqXcYV/zyAD+Q7NFWSS6g6f5AxNtjMDw3V3QjSx4qH6?=
 =?iso-8859-1?Q?eGXzSW+/2ivlrlKB8SYBs0G+PMyf4AUTkL4NZHuww8q7nhX6JtUHY2AhS6?=
 =?iso-8859-1?Q?FH3btdKFDKfm2g15jtdJ+eBKJdNDh+/EhoUqt/cceNV2UKmltS2mTfFImn?=
 =?iso-8859-1?Q?r4O2U1InjHW1GY5UtMTWsVk+L6Tvpzh9wrNgUDtrPFFlgA/b6rKaWQfOEi?=
 =?iso-8859-1?Q?nWdaT5ZUWgBKemDk0Fb03tpjlATcvVG4Yhsmf+SdhccDoiXliBpRijXf3c?=
 =?iso-8859-1?Q?yF2znP2gdthWPTE4auW7wd0b8/gli5DQhgyOJpGRB2oPB5vD45/DCWuMyN?=
 =?iso-8859-1?Q?Mx0BWo0Ta/3xHlzsCi/nD1w0IbRGBnhwiSHDJjoERKbGQeRpZIdZe1Z2fz?=
 =?iso-8859-1?Q?PwZ/af+bfKlRxbi6vJhJ/ewB02Jo4udgas7wKRTANS+AEodGE2H7xawEzF?=
 =?iso-8859-1?Q?mQpxsgrQLh2NZOiz3DwGjColr3I9Ji9d9orTTA6arFErmd9XbQQoVhD1GA?=
 =?iso-8859-1?Q?yYS5GbL0npCuU68BZpdCYzVdQa0k4a7ZDjP2TSeijCWSdu?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6134.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ddba92-039e-4cbf-337a-08df0255824f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2026 03:03:59.1090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XBUoRxIg/Etg1UHfmWRUQJdKQ5SScb4m8582sXHD0jJmbAuIcBs6AOp6a/+JB0U9JzSyLYI6NK7RPjYmNnWNjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6151

From 6add8f1c36c672e59f5acfd4e1dd267fd4df727a Mon Sep 17 00:00:00 2001=0A=
From: Juan Martinez <juan.martinez@amd.com>=0A=
Date: Mon, 24 Aug 2026 14:00:13 -0500=0A=
Subject: [PATCH] thunderbolt: Fix deadlock in tb_domain_reset_interface()=
=0A=
 during hot-unplug=0A=
=0A=
The AMD host-interface reset quirk introduced a deadlock during physical=0A=
cable disconnect. The tb_handle_hotplug() workqueue holds tb->lock for=0A=
the entire hotplug operation. When an XDomain is unplugged:=0A=
=0A=
1. tb_handle_hotplug() acquires tb->lock=0A=
2. Sets xd->is_unplugged =3D true=0A=
3. Calls tb_xdomain_remove() which unbinds service drivers=0A=
4. Service removal triggers tbnet_remove() -> tbnet_tear_down()=0A=
5. tbnet_tear_down() calls tb_xdomain_disable_paths()=0A=
6. tb_domain_disconnect_xdomain_paths() calls the CM callback=0A=
7. tb_disconnect_xdomain_paths() sees is_unplugged=3Dtrue, skips teardown=
=0A=
8. tb_domain_reset_interface() tries to acquire tb->lock -> DEADLOCK=0A=
=0A=
The callback intentionally skips teardown during unplug because the=0A=
hotplug handler will perform the actual teardown later via=0A=
__tb_disconnect_xdomain_paths(). The reset must follow the same pattern.=0A=
=0A=
Fix by:=0A=
- Adding __tb_domain_reset_interface_locked() for callers that already=0A=
  hold tb->lock=0A=
- Skipping reset in tb_domain_disconnect_xdomain_paths() when the=0A=
  callback was a no-op due to is_unplugged=0A=
- Calling the locked reset helper after __tb_disconnect_xdomain_paths()=0A=
  in tb_handle_hotplug()=0A=
- Keeping the locking wrapper for normal teardown paths (netdev stop,=0A=
  DMA test completion)=0A=
=0A=
Fixes: f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on DMA=
 path teardown for AMD USB4 routers")=0A=
Signed-off-by: Juan Martinez <juan.martinez@amd.com>=0A=
---=0A=
 drivers/thunderbolt/domain.c | 27 ++++++++++++++++++++++++---=0A=
 drivers/thunderbolt/tb.c     |  2 ++=0A=
 drivers/thunderbolt/tb.h     |  1 +=0A=
 3 files changed, 27 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c=0A=
index f46b8b2ee6e1..1f0588bae366 100644=0A=
--- a/drivers/thunderbolt/domain.c=0A=
+++ b/drivers/thunderbolt/domain.c=0A=
@@ -787,11 +787,21 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, st=
ruct tb_xdomain *xd,=0A=
 			transmit_ring, receive_path, receive_ring);=0A=
 }=0A=
 =0A=
-static void tb_domain_reset_interface(struct tb *tb)=0A=
+/**=0A=
+ * __tb_domain_reset_interface_locked() - Reset host interface with lock h=
eld=0A=
+ * @tb: Domain to reset=0A=
+ *=0A=
+ * Resets the host interface for AMD USB4 routers that require it after=0A=
+ * DMA path teardown. Caller must hold tb->lock.=0A=
+ */=0A=
+void __tb_domain_reset_interface_locked(struct tb *tb)=0A=
 {=0A=
 	struct tb_nhi *nhi =3D tb->nhi;=0A=
 =0A=
-	guard(mutex)(&tb->lock);=0A=
+	lockdep_assert_held(&tb->lock);=0A=
+=0A=
+	if (!(nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN))=0A=
+		return;=0A=
 =0A=
 	/* The reset clears the ring state so stop the control channel */=0A=
 	tb_ctl_stop(tb->ctl);=0A=
@@ -799,6 +809,12 @@ static void tb_domain_reset_interface(struct tb *tb)=
=0A=
 	tb_ctl_start(tb->ctl);=0A=
 }=0A=
 =0A=
+static void tb_domain_reset_interface(struct tb *tb)=0A=
+{=0A=
+	guard(mutex)(&tb->lock);=0A=
+	__tb_domain_reset_interface_locked(tb);=0A=
+}=0A=
+=0A=
 /**=0A=
  * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain=0A=
  * @tb: Domain disabling the DMA paths=0A=
@@ -831,7 +847,12 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, =
struct tb_xdomain *xd,=0A=
 	if (ret)=0A=
 		return ret;=0A=
 =0A=
-	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)=0A=
+	/*=0A=
+	 * Only reset if teardown actually occurred. During physical unplug,=0A=
+	 * is_unplugged is set and the callback skips teardown - reset will=0A=
+	 * be done by tb_handle_hotplug() after actual path teardown.=0A=
+	 */=0A=
+	if (!xd->is_unplugged)=0A=
 		tb_domain_reset_interface(tb);=0A=
 =0A=
 	return 0;=0A=
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c=0A=
index d18bcca0b6e6..2370d8669156 100644=0A=
--- a/drivers/thunderbolt/tb.c=0A=
+++ b/drivers/thunderbolt/tb.c=0A=
@@ -2489,6 +2489,8 @@ static void tb_handle_hotplug(struct work_struct *wor=
k)=0A=
 			tb_xdomain_remove(xd);=0A=
 			port->xdomain =3D NULL;=0A=
 			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);=0A=
+			/* Reset host interface after DMA path teardown (AMD quirk) */=0A=
+			__tb_domain_reset_interface_locked(tb);=0A=
 			tb_xdomain_put(xd);=0A=
 			tb_port_unconfigure_xdomain(port);=0A=
 		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {=0A=
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h=0A=
index 798840b24d2a..9243073cae06 100644=0A=
--- a/drivers/thunderbolt/tb.h=0A=
+++ b/drivers/thunderbolt/tb.h=0A=
@@ -792,6 +792,7 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, s=
truct tb_xdomain *xd,=0A=
 				       int transmit_path, int transmit_ring,=0A=
 				       int receive_path, int receive_ring);=0A=
 int tb_domain_disconnect_all_paths(struct tb *tb);=0A=
+void __tb_domain_reset_interface_locked(struct tb *tb);=0A=
 =0A=
 static inline struct tb *tb_domain_get(struct tb *tb)=0A=
 {=0A=
-- =0A=
2.34.1=0A=
=0A=
