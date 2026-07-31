Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013071.outbound.protection.outlook.com [40.107.44.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE971357CEB;
	Fri, 31 Jul 2026 03:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785470144; cv=fail; b=F7ikTUpmSMZBy5bDnj88j2ii0OtsbSARYmvI3XFxUkScWHO6cPkwBxmHaLpQ3OiFs9ijLUlEsULaDeqVkiHA6jjGgGoEbU6OmBcmmzuPxLMj1cQgx9uoY5blzFlRX1kr24ws6kzKnwM0piDuMIYXoWvHfwePJY4UJUNrCMdC00M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785470144; c=relaxed/simple;
	bh=4uqeFLbMCRL5ksKl40oKPWMT404XRySB7XZ5UfhB2k8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ti/EN3jONMpNBlSaq2jIYEK5VWFWTUV5oxYikIXAtu45WTE1rBd5eFixYqKUq26Dlc+xn9N25gytniz4GluwokL5G/+UoGgX5Vmk11dcr6S0vaknm5mRmXJV83u6YHIdwmQuED0Q3st+uhp32WBkqyUaYFgWTldrHQD3VnYS+LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=HnahA+tG; arc=fail smtp.client-ip=40.107.44.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="HnahA+tG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XowBh6cT1WwV/AU2Ab4IqI1MwHE0DPveDqp8feuBVfGJWlrIE1OecgRMLgqh9W7zZ6A8r61ysx/BZdLHCYR8zpyrFax3tmfBtzjr7v8OVJgdZFYuzUN9xPAcBbSYoF7Tsmav4H7x+c2/eKSA0ZgUXWPs9tu9MTdS9tSGPLLMm5Iuow9E1uUrzg4C7HA+y0nZ5lxJlgg67z2bWhGnvI9sqnlcyYIIM5Nkrof5kfu4mVo/1HJmkHuxLBRMHTz1nfYb9OlqkGRtnhEjzr5LPGh2DH1BUW+W/c8Pl/IAXvEpFPcWvqQ4YrQbITie9a7Y5DT24N92MN9z1G+PbrOkz2BlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbTSD3bQvZcBiDJ87mmeygW9Wtfh3Ly2fJCQfbiVPnE=;
 b=weevnXblRbPjZMW722CI6N+uEjZ1zpuNE3E1dJoHkKrGSe0fDz8wh6yWnvoDyi+uioI5g3c+8pze7PjOtyDnKJoVmXknFv6sBKlq05n8A4TLjQet3ltw6Pm+4FWdUcghX4AqyQkegHMgMMC3U0mSHNIkyRnx9dKRzPZyXETuFUO8zywAfAw0MWUD9pBOsMh8cgtpGaUh1P/nrgzE8/+Zr+bYtpRrL6iVCks/bgMmWLb5DiFUdqRWYY9MGGXy4vbiChvJW+vn5aYv4M7zbwkr/aQ8F6siSPxbJPbXNF0zL6y2MgHWXL5PAbOaFl4KHHHLTqd1nhs0n9Fwf1iMeGvXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbTSD3bQvZcBiDJ87mmeygW9Wtfh3Ly2fJCQfbiVPnE=;
 b=HnahA+tGWoJIQN8dgzig1C3XM4v1h/k+8rOX8jRvqFTTSIFGSLPH1ZHGpJ9eANTH4ZgaurWYYE0KttkABbpGQiyEOZKGnOSP9UeYqqSMC5AxZrKVmrFRWuhWM50U6bAh2wOofgaRXfzjeTOa9Gnxkm+Ylpk5u5ibTCvHny9XbyIlWHEyDu6EHUD3mFekGdbMae2khu7GsPzA1MlYkPtt7mOuWcytUpmjTQDlsAFAq/RVPLHCysczzjUbdkHCNgCBG8GD57b/yoX6owAoITOmKJQWETnZJT85BF+jWMZhnZPNYPA/nVDxSR2c0C1W7/mDMEDWn0TljwtT9rLbd5+Zhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYNPR06MB8782.apcprd06.prod.outlook.com (2603:1096:405:3c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 03:55:33 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.012; Fri, 31 Jul 2026
 03:55:33 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org (open list:USB TYPEC CLASS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 11/11] usb: typec: Remove redundant dev_err()/dev_err_probe()
Date: Fri, 31 Jul 2026 11:54:45 +0800
Message-Id: <20260731035448.252289-12-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731035448.252289-1-panchuang@vivo.com>
References: <20260731035448.252289-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:379::17) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYNPR06MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: f6eb6e04-b5e6-48b4-1ae3-08deeeb79205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UosP+h+LU5tci+B7kFKCtYt7MpdY7nmw9yfPs1lvxEnaXadX5mk82TnIMFtxMzrKJYE4l9TMAJFTBCEZmc5j7yBiUnzikzeCDH005RJH+Wp1YaJCbXfR8h4prDGxPbcigVlzTOdpBue/DoiSsZsbKAv44OzjxkYfthVVvuhLnwKt5mzYzy4A41trij6b4qO0fH0ZV/7TT9xcNTXjIJLA3bd/pIaOvzrh67ha1MP2B7DiUtMCXVZMcIlGiUL+KK+D5/PHq8F5ifxU+1uYR/VZkgyAQWO5P8a4ETbTP3Ul7+C9co8G7kIS4DVHIbmJ9qivlJojZO6wgWN8lV1mWPk1aOOeFf8CilKGGDOAiw/KRf2D+cDJ9ewe3XORiR2PzcQc7N1rLjbxt/pjDCUBLOAt5HgfQfQn+Wwv1xLcmfcZJC5zz/UiUPxpDmiJFqiDeJIFw5QjWbx3sTygERvYuwQNc7uu6BmI3UP/5QPw8BfLJpEoZhvpjuEBKJ8+0IrtWi2TO/7GpOy1Pk3bk3lsLVIncQ9qinQBJ7VMdT9ImlbfopO0JogP6V0FJpBCDETkoqqSEi71Sn+B7HOCLiG/m+Gih+nLqGGdwPRymJvub2PAa+TVCkmcYwfDOgCPkn7++tcjtxagqRNu2DxpiAbORw1WMHZlwgCvkI5a61/v0zWueOVVRlR0BldqG5pyQ9RGmPyTlkwND4B4cax9O2/5NmZwpBtkTrN0yTC6g2ui3Mp0Rgs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ff5Z0pjrp1NsymbFB6+9IPdPZjqEah1IdNK5rMWWJOwcm5x+ZUkW+nuT4WO+?=
 =?us-ascii?Q?hhvQHSblobK0qc+0g+0ILfuRK+9lCFxNXEXFh31MptWRs8kgglRAT9xT1fZU?=
 =?us-ascii?Q?PMMArHNQK6aVUGXf8J4wFxg618QBWnQ+6G7fF+tYv5epnWYAJPF+wshE8Bn0?=
 =?us-ascii?Q?IenKkVUzNhpMOGsBrHLQmYoI4KC/ST2tYpsl6RBRmh13kCh01la1ywK5rcle?=
 =?us-ascii?Q?pD5UPVF52uXUPn0jk40VIvQEkClXiEhIrIGbYGh0Opps6DOgTGVUqMNiM4qO?=
 =?us-ascii?Q?ixkulgXl7r14znzQyWQVaGGU7knWHCe9dxSgCd449nsQUwaq8BA6EZFzjaID?=
 =?us-ascii?Q?9egxjL6aRTeQWeN1T3SVVeFexPKb2Ex8xxkq5cpV1zu9LXM+bFjYwuQmKysJ?=
 =?us-ascii?Q?EdHDwHB/gd9OFll6dNOolRjQngMCu4zUwSr7PzWE+eE6pThvelr3SpZlDXp/?=
 =?us-ascii?Q?1YGbxfXuKYpb3zDiGkQaj70EfrAmsjt9jdD/ZrDX5XKMXYnUPvXgu3ska6og?=
 =?us-ascii?Q?rJBSBsfaVlwo9DXu33UrGfq63LaXpwOeCF5F7JefFVThxKhqYjI0jwNQ4Cyn?=
 =?us-ascii?Q?81VgnL8NF0yPV4kr1k/Z0erRl1GU2EeFHT9QGfqKhHTY0RnYu4rvEazgwV5z?=
 =?us-ascii?Q?LlS6YWFE6am8oJ9opr49v6day8UkSotDD4r3FQIs8uwaTo9UfwRr1MQjMDRZ?=
 =?us-ascii?Q?NDfy6iaPqBaeeIS/5Ug9Xi++T+QPhjg3yiclt8gmwBA08ahXimQ7kcl4KyXW?=
 =?us-ascii?Q?tiGlywdm5AIdqqEUFiFnaQc2mF9jknwEn9QwTDqbYgVyM9Wu/VFjq+BNzvNA?=
 =?us-ascii?Q?Jvt3+UIYrRTinTxIJgqqPX+vdzN9ziJTy8cqNsDj5ZYB9vdb0TVAFF9+OVoW?=
 =?us-ascii?Q?PNIPFKWHfKbF/cVhikZUw77Y9CsyW/X2RB3lcAMog/jwzjFm3aWnpU4839If?=
 =?us-ascii?Q?Ek7223frOtp5aSisM/opnzevEWkNpHNrs/afm2oEb4hwhX8bPiBU6eEbayZn?=
 =?us-ascii?Q?EwokQXP8TgXG4SyauKCsVlvcGjDBdPI9qyENb9TyKMMqyTfwM1eEuXX5Wu4S?=
 =?us-ascii?Q?GyQE2n0ATQixwr2yIreMH/yNGw55HGc829pafh4nx9JQt3NO8pce2AN/KvCr?=
 =?us-ascii?Q?4mHCvxiwjJoHqvXvSkDfKHcMqC4zc4oRGRaZdtlv4uzll/UvWj5bvMMHvhUo?=
 =?us-ascii?Q?dJPleTpikgJrazeAoyjukpYWatXghCeRD+R27fYJwjvhQpxxweghUhaa0M/p?=
 =?us-ascii?Q?kFHsOxy/FdZgjtOBxRBVAXcTLT/rWXQBwlrn1moh7epboXAKcgzEWRDNLNjc?=
 =?us-ascii?Q?JBeDrXzv3B+3ZAhamZ8AV0NXZvvQoDnWgGLJiYWC5Mt9U8KGo6pIlgCHmKTq?=
 =?us-ascii?Q?5XPef4N88yFvqJQaoJ0FPn0a8F1dFWsiDfK9pYEo/xoo5JJ/igrY76A1yTAa?=
 =?us-ascii?Q?0HgTuiTskvnDcZe/UNyM2F+2d10i6Ql097Cw0fx6w8P03RB3JzQ+g5KBdsR6?=
 =?us-ascii?Q?J9PceGe75HUbQ8xknIq5sCbUt8nR14gNZVSKcQl+6oPwAdlBwog786sv9Urb?=
 =?us-ascii?Q?ybJZWfdQnu1KsV/ozggihcsNDstgLwWY3IMsiFpGUH0idhDoSrVH616qGDc6?=
 =?us-ascii?Q?Xl+nG3TPH5Vo37Ubx6JDvbzQq6j5+V/F0qJBJ0/vMrar56+2k5+6OcIvss4C?=
 =?us-ascii?Q?Bc8L09RGmIubL15m1Z6gmZusAOOBJ7y4hPANtYlsB5JHOiwuROGoMZkfyG6u?=
 =?us-ascii?Q?/rXjXvVFdA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6eb6e04-b5e6-48b4-1ae3-08deeeb79205
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 03:55:33.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WayhoAR+zuiwap+bzl3pgCb2HmxR58rKOYIi9UnP8v/MZqlplS826sKx/g2sW3rtQDHaxSN5jUnzopV1sTZxMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8782

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() and dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/usb/typec/anx7411.c               | 4 +---
 drivers/usb/typec/hd3ss3220.c             | 4 +---
 drivers/usb/typec/mux/it5205.c            | 2 +-
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 3 +--
 drivers/usb/typec/tcpm/tcpci_mt6360.c     | 1 -
 drivers/usb/typec/tcpm/tcpci_mt6370.c     | 2 +-
 6 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index 41df115912b9..2c41e00819f8 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1529,10 +1529,8 @@ static int anx7411_i2c_probe(struct i2c_client *client)
 					IRQF_TRIGGER_FALLING |
 					IRQF_ONESHOT,
 					"anx7411-intp", plat);
-	if (ret) {
-		dev_err(dev, "fail to request irq\n");
+	if (ret)
 		goto free_wq;
-	}
 
 	if (anx7411_typec_check_connection(plat))
 		dev_err(dev, "check status\n");
diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 3e39b800e6b5..64648686bf8b 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -436,10 +436,8 @@ static int hd3ss3220_probe(struct i2c_client *client)
 						IRQF_TRIGGER_RISING |
 						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 						dev_name(hd3ss3220->dev), hd3ss3220);
-		if (ret < 0) {
-			dev_err(hd3ss3220->dev, "failed to get ID irq: %d\n", ret);
+		if (ret < 0)
 			goto err_put_fwnode;
-		}
 	}
 
 	typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
diff --git a/drivers/usb/typec/mux/it5205.c b/drivers/usb/typec/mux/it5205.c
index 5e1a120b2e3b..2ab2ba6a3cbd 100644
--- a/drivers/usb/typec/mux/it5205.c
+++ b/drivers/usb/typec/mux/it5205.c
@@ -250,7 +250,7 @@ static int it5205_probe(struct i2c_client *client)
 		if (ret) {
 			typec_mux_unregister(it->mux);
 			typec_switch_unregister(it->sw);
-			return dev_err_probe(dev, ret, "Failed to request irq\n");
+			return ret;
 		}
 	}
 
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index 998693a61839..52dbbbe53691 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -542,8 +542,7 @@ static int max_tcpci_probe(struct i2c_client *client)
 					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
 					chip);
 	if (ret < 0)
-		return dev_err_probe(&client->dev, ret,
-				     "IRQ initialization failed\n");
+		return ret;
 
 	ret = devm_device_init_wakeup(chip->dev);
 	if (ret)
diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
index 881ffacbfd77..d4010ea5183b 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
@@ -167,7 +167,6 @@ static int mt6360_tcpc_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(mti->dev, mti->irq, NULL, mt6360_irq, IRQF_ONESHOT,
 					dev_name(&pdev->dev), mti);
 	if (ret) {
-		dev_err(mti->dev, "Failed to register irq\n");
 		tcpci_unregister_port(mti->tcpci);
 		return ret;
 	}
diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
index 7d6c75c70985..2e85cb05ed37 100644
--- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
+++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
@@ -168,7 +168,7 @@ static int mt6370_tcpc_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(dev, irq, NULL, mt6370_irq_handler,
 					IRQF_ONESHOT, dev_name(dev), priv);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to allocate irq\n");
+		return ret;
 
 	device_init_wakeup(dev, true);
 	dev_pm_set_wake_irq(dev, irq);
-- 
2.34.1

