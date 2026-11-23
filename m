Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795419999;
	b=RtINcDQQdUuQy2V7FqT6rG0wekBIEz7jtuLrHn4uGkMEQ3yojgih9YrOyS0i9hX3XAAW
	 VhtDLn7BhDvOmrAYHtBH9bI+TpOpbSSpNxxVQXxgl3mOlbnFlU12vKysBer2aFx5KQ8JG
	 FtKSj3sAC5yISg7tkTQ+m8nTkcICj68mm7HU082nEiHVMOhheXXBDY60McaXUuoW3j2k9
	 YZXxJxkW79ZLLPrQB7RsZMu73/EyLW8PrE91oaIVvAoho7LvZb9b3mitEKgFZCxPZa0cR
	 8bUuGj/uqfv5GrFQ5r4RNSir417F7TsY2cZn9wvrzsdjlEqPia0WXRLOJW9Pw4pWBsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419999;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=RKohgNXBmmNn3Ev7J7dTvcE+DhI6RIeeoeE/tLerCKY=;
	b=t+qRdWnNL32603XPxzvrqRQehL7ZPivLwAxDiuKPtk46klBe58oXMQNe/Rjw865VeKyd
	 1tDAoWU77AjV/0VZfWzQ+1CD1fsBReDWaltgPJCFzY11BJ7Ji5uCd8UJFk485D6ISq0jl
	 sbbQratUYMrrwzXc+KarSYpMv6pF+OOgZqqAbvj7IqGMqodyk8vC5GAYc939EfP3fac86
	 +oLuXYGTUYYMw9iHQbjNZ2CaTQQ/2l9HzLTmZAVhOFObWCFm/2eDHX7pWMxdIe/fAy0kR
	 NwXC9omn4/I961d8VaEtVkQhTE4MS+VXy42vZ20t3+jz4YVzDmzZXPEXG2HAhX2zKmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UpRzae1v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.27
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FB1606A31A;
	Mon, 23 Nov 2026 07:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FB1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UpRzae1v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=supi1JoYVH0bIm00qDnYQNXC7NnAHIUePXj/exL4ZvpAXp768T0JRnUEhIINACWc//vfN8rVXWWP3N88IV1I5l/q4vaXOwWu9wQiuHvfogg7LThUpXmLghKnWWWSweieODBOXgjpGpdyGnk7FoPujXCQ1tMrnqg37rTTbtkSBnOM6XPspO8nr+EcGPv8g8uzsi8LoeNW3tj7Z9jW5SufbYhlD9zmiZfQiHmKjyBBtgmJrHx3vtiungFs6h/QFSslvadzVoLYq9993fGjWsajFM/Gz4nmjSKmvoHPSQWYSdLwaFRj76GQoEtXZ6sG4BPw1yKDCa6J7bf58VgFGJClpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKohgNXBmmNn3Ev7J7dTvcE+DhI6RIeeoeE/tLerCKY=;
 b=vI5F+yEV+r499B8iGyGHoJDdJT+nR1TJComcteP950Pz0aq5TbqPIUywGdwMxgL3W/g+7b1vdlm0XNa7lguDbSKAH2B30tse8HR728NhBlisi84ZsRPn4d10VhWukUGClYhgYmunL4/x11KkeBtLcMQWZEic1czvYnTFUWFrIFeovq159DDlY/a2ACAr9jwGeW/BhshOyAccy/V76+whrgy4LJUUphZGrMOm02AziYJJBRIoZ7KQWKSuAKRdJF8WGvDh1w7gUsn6gwE+GiRJUtHdf3D4XdPc+48M6miwjpgwlgkq6wefvgXHP5WjVW2IE1oWvek0+eCa9GV/E0yXjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKohgNXBmmNn3Ev7J7dTvcE+DhI6RIeeoeE/tLerCKY=;
 b=UpRzae1v3FJJn0G0rlbCGCZyeANTX9EElqQAg8iHcUGEnhrlkbFXF2nDnqrh2hZvJEAd0oQaoj+8b5WKPvyZdGMyVY2lv2tV6BMoNezyLFP7RSECoxeUZPFkSX7OdBVfam9DKBi8DwMXsPpJh6miQZ1Ola1ZtIuQjXoeESbkIlwGWwmkRdUOpHq5VMFTjFKUvcRhijnYe+yXpFNjJ9D/EUcwTf8y+jR9411NLImTdIM/DIMfnjrxRkDq42PXvp/V9EkrejwEKmJPMEptX+R5EpzN2OLdDfGznGtCxxa0kVghp/A4tANnMWojfKWilf2Y6x4ww5b3ApitPUUNtVdJQA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by ZR6PR04MB438545.eurprd04.prod.outlook.com (2603:10a6:910:e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 07:46:35 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 07:46:35 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v3] usb: typec: tcpm: advance vdm_discovery_state on Discover Identity Not_Supported
Date: Mon, 23 Nov 2026 15:51:36 +0800
Message-Id: <20261123075136.650549-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|ZR6PR04MB438545:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf1bd28-13aa-421d-c34a-08df4935e5e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261022105027099003|261022113327099003|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KTtCv7NPJRk93QLvrJshZXoaL6TVHt2OXex6RoVZV3BLFFo/Mt4Shks1ShtJU/FuLAGRQmfNNaWAB86r+uEq9e8IXOy5gn4ihLQ/h/GcgZCZzn+FxnTHqT7rKu5c8M4N8I1ApZ5q4k56FMpIXqdg1oZZFEchXJa8T+2AzrA8HvRNBZqNtYH1MGhSADHfNHm5Aq7Md94gf4SLbCTO1jKgwIUCddpOIuPw0vFLKOj9f9iQ6oysAh9z2MUmQ9bU7iajq5aSy28VIcV6iADrzALuT0wCw4rwVM+S4AnloYA6ooPAsQElsTzsI4w83Aljn43oH2zbvfFqD4jkvTPZouRyL9O3wAb3NM5+qoIjypSGRcjcJijVDLqhBroadtJssIL7MJQGYEy5xTFlajd4jv371rnp8otEqs4CNqfQiwMN/7xK8Cd2g6pmaiIfFaPd45uTSxu+Ie2Stf708mmwJ4hjEe68QAnxiryUQM7rAb+eU96/ykvWhQzoYvLBTQTLUZfQpHDy4IkYQ6eVwCDBYS4YRInmSqANhNToZz3QNzTXYSs/gJg7RVUXRRbVwe1zjfK1b2jglRHOX914hQ/LTwQ2pw1yelfVqlrcsU0gYxRZPYMAyZ9NpyUjBWS4WKDFL/of8WE0poVLkjiXZ0VPoJLVSNKUR3GmoHuD3eXrm0+2So8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261022113327099003)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bxqUeUk8Huacqh8rj3qghwKxWB9BqYmltzWg97WWBGKaXW8/NmhMhE4HBh4R?=
 =?us-ascii?Q?8RdSms5L4Yxi0zLO9Yjo2uFBrIxEUcmaWrIfd3JD0RNIHOPYiQAPoIlcIHgS?=
 =?us-ascii?Q?Qk8y4oAti6PewsEWgtAxduhrANMwl2qVGPZ1hmbLGmxpljK6V9t2Ax5Lrvze?=
 =?us-ascii?Q?HWr7xiW//f900TUrGNWse4+O12abXWhe2ZhomweBARx5uhJZp/0DNxQ0Z5vL?=
 =?us-ascii?Q?A7icXusMd8SVA8kASf8xG/CSeoeDiU/807CdrOTPFe923Yym9UmYp73RgM3g?=
 =?us-ascii?Q?kvQ862YRMq90CNmLA25bCnPaI7IpZmaLIcPX0A7r07Haa8IiLseDmMhjKI0B?=
 =?us-ascii?Q?Hepoxa+sLt50Qmn1+3F2yGOY0rjRR0oqb89wMIhMHuezIrOPGF7zdxudXgCh?=
 =?us-ascii?Q?RipAudHYGzB+2vud7T2k6d4xv9K2u++KVAhs32JQWSHdBixvvjes90djjxxY?=
 =?us-ascii?Q?IZa7SzHE9NP+I2w7V//bRR/hFuOCApxIr/kvnGU+joQVPezPpSEyI6tirjVd?=
 =?us-ascii?Q?TT+meXZzJFHYWPOQm/x6+jTxJtYT6DHWUymSH1AvBrNtDcu1QQJtWuToI99G?=
 =?us-ascii?Q?2KpYrs9sutBYOcO1anB1i2a6gU3ybXQXER2tPW/pZY9+rEnvsSPwkVq/j5BX?=
 =?us-ascii?Q?kA3MRUxmwAa7J2tQnRaqiJ6A63abazq8I66fCaj5K+MdTDctsG4r5q+FwSYz?=
 =?us-ascii?Q?G99t8SkiK2c4ui5WB0gzg6ArZxRxFaPPAWeIGlPSNb4ZSiGKguLgWWLqTSNX?=
 =?us-ascii?Q?RVpxpPwlMC7IZ28DeOXNPB4tR1WfHluXYe3ChLPm3n1l+JnaOtJbINHuGTHl?=
 =?us-ascii?Q?XqA9RpNpGa+iA4miLH7UuxMFuf/WT+JDz4qv/2j/SvDOq8Q+tezz47rNe0Zi?=
 =?us-ascii?Q?Q6oHtYXjvLAKd9Yg8JiXViFjY+LClN/RzmPgCmHrdCQrk1upy5RYPNIBxxSz?=
 =?us-ascii?Q?g3Tbd82/a+s3ZzkGmlra/bCLBJucK5ip4VnJd7cn85VdFUIqkNuhxE3OPUoo?=
 =?us-ascii?Q?VQytRu75z0pPEpxUBKb2PXBOewoKGZpEXqdRxxNtNrWlBctHx5OqDZj1EZ7W?=
 =?us-ascii?Q?fF5kYnIshO6i345CAPOq7Pbzb46jE1ZBtJtfJ/kDroOAdvyZQQ3uBtVU6jfo?=
 =?us-ascii?Q?qz+5RxsHv6fDbwDeoUfJwZA4lGA2n/3x7Biz49FCL2Mk5gFW2xL9hCwJwx08?=
 =?us-ascii?Q?XjmwmuyKPahzcQclzG7N13CObvH8D4tdt7yXiuYvWDxtuUBCEaqttE0b5QD7?=
 =?us-ascii?Q?Te7AuhG1396BQs2w0hd2EZFBcRdKucCO2oQVkKXAOVISqhaPVBJl/yCb6B5n?=
 =?us-ascii?Q?9tCY3JkRK0oIPnfn9XQedg/XcE6H02qJJdsdHVdVqmfC04kixNnT2vEKAps/?=
 =?us-ascii?Q?k2Ecl0jfTIcxq/hgh/X6i+eV99O4QJ2yhxqUnxemZGjHC7KsVpQnOQnSbNXn?=
 =?us-ascii?Q?lGvueNSTjZAcniMcARjPBahZiFBludiRU4xvbgzLurEPmq+20DB/M6R4caDu?=
 =?us-ascii?Q?ewgw/8blZ4Cep4xXOwpRD7c092EGKpnCmaOlIKs+wjc+YPHgLSYMMzPeT+kx?=
 =?us-ascii?Q?qKqMHTnxpVwhwLaH5py+8AZK4GfWjenYk4t1tMB6ukhdO0N9le7nQoZ3/268?=
 =?us-ascii?Q?0mNwT5SdGkrbkoPtwulCdAcAZKOWIdtQkaJ9ZrBHaQ1JSkG4B4Jl9e8E6fge?=
 =?us-ascii?Q?WWHT4v5MxXI1VafHln/H1P4kasP1E2IN0izbSmilgc46+CoYMJEIfySCorL1?=
 =?us-ascii?Q?3aXIRlxL9GFfR+2ADFor/izq3kU4Kg0YPqKh+wGz3V6AzynKdEMo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf1bd28-13aa-421d-c34a-08df4935e5e8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 07:46:35.5597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMV4n4j3XhKFLuvYJ3cZzvMaOt+F6Txe6X7gegk2kcMxf9UxmS4hh6npuztRKK3SdfsFRUOv4ikWwQO3ZoL0qJUJr8RMk4MOnaaqbTdG4/RN77DQYTtbkjzyytjCsWmL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB438545

From: Xu Yang <xu.yang_2@nxp.com>

Commit Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism
for Discover Identity VDMs") advances vdm_discovery_state to
VDM_DISCOVERY_COMPLETE when a CMDT_RSP_NAK is received, but it does not
advance the state when a non-modal port returns PD_CTRL_NOT_SUPP.

This can re-arm another vdm_discovery_work if the port is going to
respond with PD_CTRL_NOT_SUPP to the partner.

  tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
    tcpm_queue_message();
      mod_tcpm_delayed_work();
        tcpm_state_machine_work()
          tcpm_send_queued_message()  -> send PD_MSG_CTRL_NOT_SUPP
          run_state_machine()
            case SRC_READY:
            case SNK_READY:
              mod_vdm_discovery_delayed_work(port, 0);

If both the port and its partner do not support modal operation, they
will send DISCOVER_IDENTITY to each other infinitely.

Advance vdm_discovery_state to VDM_DISCOVERY_COMPLETE in this path as
well. In particular, update the state to VDM_DISCOVERY_COMPLETE if it comes
from the port partner, and to VDM_DISCOVERY_CABLE_IDENT if it comes from a
cable.

Fixes: 205dc9cb39f5 ("usb: typec: tcpm: implement retry mechanism for Discover Identity VDMs")
Cc: stable@vger.kernel.org
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: RD Babiera <rdbabiera@google.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - cc stable mail list
 - add Rb and Ab tag
Changes in v2:
 - cover a cable returns PD_CTRL_NOT_SUPP case reported by sashiko
 - kick off vdm_discovery work to continue working
 - correct previous wrong fix commit id
---
 drivers/usb/typec/tcpm/tcpm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 51e5c72799f2..09bfa596bc5c 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3909,6 +3909,16 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 		case SRC_READY:
 		case SNK_READY:
 			if (port->vdm_state > VDM_STATE_READY) {
+				if (port->ams == DISCOVER_IDENTITY) {
+					if (rx_sop_type == TCPC_TX_SOP) {
+						tcpm_update_vdm_discovery_state(port,
+								VDM_DISCOVERY_COMPLETE);
+					} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
+						tcpm_update_vdm_discovery_state(port,
+								VDM_DISCOVERY_CABLE_IDENT);
+						mod_vdm_discovery_delayed_work(port, 0);
+					}
+				}
 				port->vdm_state = VDM_STATE_DONE;
 				if (tcpm_vdm_ams(port))
 					tcpm_ams_finish(port);
-- 
2.34.1

