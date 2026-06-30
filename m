Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013034.outbound.protection.outlook.com [40.107.162.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AAC35DA42;
	Tue, 30 Jun 2026 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812732; cv=fail; b=oG0OWH0MlyZG1tsia7Cm4qz6iH7Dn9vFdib1dlAQkr4zIxsf65tO2Gmrk/CY9C3myT++BSytSfqEHEhqsZlxToV+vSzBYY9IhMn7nt60T6ih/2CL51BGL5MpsqKIUNgpDjA1QCBlB2FwSyakY7bcGB29kgBEf+VMjfo2m07XpnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812732; c=relaxed/simple;
	bh=pZ7yLRo6XBfyf1oRc3XZGgTy87sqEJqYUSMu4K7f7zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tW/LKUPztg89CAE27QzO+IdFjMBjDU74K82V1CxFuoMabBarnBH90T7FTBz2w52pApLCnwbfpH4VKWjlCVHvuGJ9Gfn5nUIB8Sj4PSG9ErGZ/LAFqHbVijS1Xy4eNHacl1HATS1pEm3PU3OWzAZ2a1I61oTVMbSqo0z2ySQSfAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KtnaKtGX; arc=fail smtp.client-ip=40.107.162.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KtnaKtGX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMT+CvMYB/gUDyTFs1/ek0rpK3mkF7bU3lIGC0i+cp2D488KpnP3gx6D7jaNPZ25VkxDBqKX6GcNfgqMeCzJv1KzolGz/w7RBHSom6iupTdoW4amuLPY6/3KeJm4TtCmjVJS4ouQqEQNVLglPdXmpwjkp8BTN2LcDHg6uh3rFNLQkibDmjdkz4YIZuv/LxAH6JD/2dlc6VeX8OC4r5PMZo1o+xcpjXWqCpXhzyC9yJdHFLHUGrblKxUiBMt1VrrtE86PsUk5hH19fOsvOto4yoj1aODPzhn2HXkBXX2VfidW1xToSkgQDR5Zld8AyiqygR+x9/yA/j5+uWDQGhT4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFkIBW3FKvbQ1KJ8VHvR7DuV49jj++Q3ueGPi4SNOxw=;
 b=RI+kMvCjr4ThFa9qZnedFx6LpwkW5rAAlt6bb7AYmYLUv/fwB47wrk9SEce54viSRNC+yefpo6++yq/PJ+KoV4x6oj8XelPh2STT1/0TaWiYpMamca0L7xsFggkGrPcpNODZZoJNUSTghXfauxaCHbiWvTDdpicRYiB+HtAuuKEF54qcgJjHB8DQ5mea4m4qzoi4AxuJFbT4UWyBfXRhqf0pKVRpLWs4xfCu7ZdEzC9tiM24C3T+P5VR5C9ZSO7BsElN4QrVoL7zzr5lXJUmd4D9mEL3K0Z7qXnOC/7DzmSkOcFXCxnSHlHXovwH470huuXBGbrsUOc+5eRq7/8VZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFkIBW3FKvbQ1KJ8VHvR7DuV49jj++Q3ueGPi4SNOxw=;
 b=KtnaKtGX5pjfAWHlKZjhjeE2sRyvsfJfXpGTmSjAwFC01RnHURJM6LwuPLNTDJa1ICltz/xc7AM0keoOGbaFGJKbN81BfqvumNzZMo6FeIISyE4hHeP/p+hVolD8pmre8Nq7nq+Ufzzn2DEJVEoGMKxXTAWGkKajpTTlCNIvCyH2VUAzX7ayD1rYHywY9qbe8cI8tlLl1pSp0zahAlfCFUY/ikIycVopWbny5MY5x+gc1M7sNeHyZZyKsCNvXGDS1MrVp38lXv4yTGSiHYLJjDplms0Gaq//uWjNNcpUZjpEynxiyu4U+Rj41t09VrdTrXD6sW0pKoLd9+nA8C8fZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by VI1PR04MB7070.eurprd04.prod.outlook.com (2603:10a6:800:123::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 09:45:26 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 09:45:26 +0000
Date: Tue, 30 Jun 2026 17:44:11 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpm: implement retry mechanism for
 Discover Identity VDMs
Message-ID: <uwxhwziw25earfgsn55zikihnv6b4g4cesxlccrei2opk5exmn@a5wu4h5sg35b>
References: <20260625215431.914380-2-rdbabiera@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625215431.914380-2-rdbabiera@google.com>
X-ClientProxiedBy: AM0P309CA0028.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::6) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|VI1PR04MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: 4add1029-421c-4de1-290f-08ded68c4fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|22082099003|18002099003|5023799004|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	UGJEJWA39xpgNG2+e6TbwjsbdTir2vtSnpiVfzIBZM6NTWuOwbrL/IFI+ORy8Lx+EZ8Ho+1IpCPpcpPV/alFBlDGZAlKq602HOekn2yh1qFoHplODWIi8RB0STKdwgWKKlRRau1usiFdJi6Ez13NBFAMjB55VljkGAhSGBNWqXWkm21ePI6ulIrWSgaKBXZIPJ6dU8D9hwzDtVO7s6e+zHQ92k+CFxcM4kQTiyRtXOSYsPZ+KcY1qKtwYtSWEOb2rK9J+AbHuJWzab4PwwsEclCAwWSbMG57/6gq+IUXdNxbuBKrihxPSAbmxyTOMyoHWkoXvC07qTBpT7E5VlXO+CMfd8EIuQgPKAixq8BYT7IpFZKaVQO7fzCT19bsJ0eNumicPAn8z+w5H/SwOgE4k0SnJny7stdnK4RZAvfXKyFCfBxtnopC4rojw2tbAxafFfpgNpIWlxp9+99dvcLbzyQBvAim27eAXuNj/cY4aEtgYb0FIJ0prTDoCd2UpvapINgfox6Ab9SPH9O3R/ZboHBt+RL5a13fgAqj8Esr4kkioCpqsijpqaZUkKvLF4hTU0RZWmrA4zgMlDYynLvec+x2M7Zdgq9HlmAsWNA79s2SXRAN7XvRAu3/VF/Ku35kdiWwKR3CqXa2mBDXHDTqlUGkXBWS15m9QfPMeqqLyS0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iAST5KmNnKsh9ubCU2vPl2PqhbdiyhNniCEKZVgAVGEbe3H7F+gu5GOwVR4P?=
 =?us-ascii?Q?AvR0WRIRILDk9GaKEpqNty1uIg4BEbUo26QsbvGwaEUqnZ17Kem0Zia0eRrA?=
 =?us-ascii?Q?rNE2EPg9xgSWeDgVd0KSENBJiT/e9172dtO2suwFYA30bH6AQXLUAEGH8qnv?=
 =?us-ascii?Q?G/cRKtmrnwdZ11zUYIieLsmILjle0YnzXQFMaaMXJeJosl5Ia33PrrreO7AG?=
 =?us-ascii?Q?Rt2RnwxIdwgVKOgqvB24Jzl2vXsSqK07S4/BUlu0cIfv7DbirOBXVOEgyd5l?=
 =?us-ascii?Q?X5jbLG7YLuGnzZzeOzlaKDU/s8Z4xE2V+Afl4e0wXEo3WsZ0wCjAEZcUdQIo?=
 =?us-ascii?Q?ITIvA25JvFvYnNUAA6pjyMPp/H2nG4gDn1kdxR357tMatvBafqNwPVXMJQ98?=
 =?us-ascii?Q?Z5zrgRm4KoDfq53MRYmr4eNpek8uCTvedzhJBnIogVZi3X5nS4mKCxAfvNf2?=
 =?us-ascii?Q?Ysrs38PvMYSy/yLbjX3/3TxBiRxAW4PCc4C+xPMvMfP4FcXQQKO9jFZcNDSR?=
 =?us-ascii?Q?V2Jg34rdSdrRpXiejBSRP4+qaALCgYfo0KcvI/ve8qJqlD911a9/Sbv+6Y0k?=
 =?us-ascii?Q?sFeZdhje+D0PpHWKWgPO52hf9THUhekSZqnt8kC+cQ5IdKadsQqyhbBMrDCb?=
 =?us-ascii?Q?M4nz2KlI9oFvnE5Z5j2LT9CYlx+YvmcQhvlBvCQNw1/GSk+/jWr7+DIm5VhF?=
 =?us-ascii?Q?57qG9HvTalCKdFAYCfE5p+99rKkSgTzvVNklahTUFq9JLx18O4qpnXzQClkH?=
 =?us-ascii?Q?GXiG2vjCaQbtBhOfNNuN5JTjV5u3M1i/V2weTynM/inPNqcXZRuOuvBc0HeC?=
 =?us-ascii?Q?xa7W1nDJFk8oEqhuf8BcYeVlxq+v/9T7N9lU7cIplQKOkIGwT/JglFSzBHuE?=
 =?us-ascii?Q?XfKj/0r73XOPZGRaHf9xEln5YSQus3K4Ga2YnyLbVDXeCdSdDzPUCUpF1Wn1?=
 =?us-ascii?Q?2hE/wyv42wbUe8j/xqSxMr/LPs8U1RBX/rNfdZyf259LLs9eIKBH7g/pSDgz?=
 =?us-ascii?Q?OR93xjBgvPlDXPS/EDXR1Gb4zj3rLuwTMHbBswsC9GEuhhOpx0GPFtBxwnBK?=
 =?us-ascii?Q?DIQaekmGL/6/etpSnZldvla015N/MndzennEPio4gtj/jC7BXQfdjn0R5Arp?=
 =?us-ascii?Q?/+rFAbSHTf5dL4xy2m5zgWyUVanGepIbQiAGrQZFGT12UyqYlqsxmT3+eoJr?=
 =?us-ascii?Q?Tk6D+x+n6uo1brS+QmZpDkgruH7nL+EoMqdRzqLFOWUdFRGzcbseVwRp9dTi?=
 =?us-ascii?Q?lYDb9Ga4+ASXazmJoxw6JsswpLmG7GZgERGHABJ42lnJu7lUMh3PSBPbOBjk?=
 =?us-ascii?Q?p8uz8RWYMxk4oLiWMXDGNZRg9uJVMptx3k7JiP2wAAalHelP97ajdu/vkIkE?=
 =?us-ascii?Q?NGu8QnrDTCIHZXmRPZ7H48CoZlHEuYGj3dqAzPVx8EcqqvZplsL/Og8fRuuh?=
 =?us-ascii?Q?5dO/RrrMydkrgyRtNLlF+75O4AKw2Rt4TvpaUeyddwaCbSdLRz/q+MnsohDk?=
 =?us-ascii?Q?y8+CFrWLejIyon/C9i0YEZAo64Py9IGq3K0cA5eZjSBtdRa4Cnhb7NV/zmUW?=
 =?us-ascii?Q?RIX/hd+oUsuf3NHjaBSZxOsRX7jMe8cQVcIZdj1WaLQG/UGRRu6mkv51nr6W?=
 =?us-ascii?Q?+SmPPFefuYbVoGgjtJUmXuxCYxDzN93Xv3J6lPrg3nmZFVsRQOR+Rh2XJGrr?=
 =?us-ascii?Q?x/hGMBVISDgbXar+VKF1O/dQZK3halaLt1hSmLrKl4atLrSfeGeN73YRTkse?=
 =?us-ascii?Q?iOnaUzK4B8dUPhUkbrPln9vRu99zlZmcnfRkOvZQ7hyEkdS4bVSt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4add1029-421c-4de1-290f-08ded68c4fd4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 09:45:26.1418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DCQCATnGnzgESx/LUj7sPkyqobxFAZe3Vd0wyHwhJp+rGR24V4aWKGT1qVFQgTahJelFuvjJ33yQM3sJJo2eu6D15QOFvcWsq4dGW4DdALdwYafQWST6mryRoHlREj3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7070

On Thu, Jun 25, 2026 at 09:54:31PM +0000, RD Babiera wrote:
> The current mechanism for sending Discover Identity in the ready state
> presents a flaw where tcpm_queue_vdm can collide with non interruptible
> AMSes such as GET_SINK_CAP or VCONN_SWAP. vdm_run_state_machine will hit
> the VDM_STATE_BUSY state, and Discover SVIDs or Discover Modes will not
> retry.
> 
> This patch introduces a state machine under the enum vdm_discovery_states.
> The tcpm_port field vdm_discover_state tracks which step of the Discover
> Identity process has been completed.
> 
> The current TCPM implementation utilizes the send_discover and
> send_discover_prime booleans to queue Discover Identity in the
> aforementioned collision case. These booleans are removed in place of
> vdm_discover_state and send_discover_work is replaced by
> vdm_discovery_work, which runs unconditionally in the ready state.
> When the Discovery process is complete, the port will move to the
> VDM_DISCOVERY_COMPLETE state and vdm_discovery_work becomes a no-op.
> When there are still Discovery VDMs to be sent, vdm_discovery_work will
> continue based on the last received response from the port partner or
> cable.
> 
> Signed-off-by: RD Babiera <rdbabiera@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
> Changes since v1:
> * fixed lint error regarding vdm_discovery_state_strings declaration
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 417 ++++++++++++++++++++++------------
>  1 file changed, 275 insertions(+), 142 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 7ef746a90a17..ba5aafa74947 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -212,6 +212,88 @@ static const char * const tcpm_ams_str[] = {
>  	FOREACH_AMS(GENERATE_STRING)
>  };
>  
> +enum vdm_discovery_states {
> +	/*
> +	 * VDM_DISCOVERY_UNKNOWN: The port has not received a Discover Identity response
> +	 * from the port partner.
> +	 *
> +	 * 1. The port will send Discover Identity to the partner over SOP in the SRC_READY
> +	 *    and SNK_READY states if there is an explicit contract.
> +	 * 2. The port will send Discover Identity to the cable over SOP' in the
> +	 *    SRC_VDM_IDENTITY_REQUEST state if capable of doing so.
> +	 */
> +	VDM_DISCOVERY_UNKNOWN = 0,
> +	/*
> +	 * VDM_DISCOVERY_PARTNER_IDENT: The port has received a Discover Identity ACK
> +	 * from the port partner.
> +	 *
> +	 * 1. The port will send Discover Identity to the cable over SOP' in the SRC_READY and
> +	 *    SNK_READY states if it did not previously discover the cable but is capable of doing
> +	 *    so.
> +	 * 2. The port will send Discover SVIDs to the partner over SOP in the SRC_READY and
> +	 *    SNK_READY states otherwise.
> +	 */
> +	VDM_DISCOVERY_PARTNER_IDENT,
> +	/*
> +	 * VDM_DISCOVERY_CABLE_IDENT: The port has received a Discover Identity ACK
> +	 * from the cable.
> +	 *
> +	 * 1. The port will send Discover SVIDs to the partner over SOP.
> +	 */
> +	VDM_DISCOVERY_CABLE_IDENT,
> +	/*
> +	 * VDM_DISCOVERY_PARTNER_SVIDS: The port has received a Discover SVIDs ACK from the partner
> +	 * for the last SVIDs supported by the partner.
> +	 *
> +	 * 1. The port will send Discover Modes for the first SVID over SOP if the partner supports
> +	 *    modal operation and valid SVIDs were registered.
> +	 * 2. The vdm_discovery_state will move to VDM_DISCOVERY_COMPLETE otherwise.
> +	 */
> +	VDM_DISCOVERY_PARTNER_SVIDS,
> +	/*
> +	 * VDM_DISCOVERY_PARTNER_MODES: The port has received a Discover Modes ACK from the partner
> +	 * for any mode.
> +	 *
> +	 * 1. The port will send Discover Modes for the next SVID that has not been discovered to
> +	 *    the port partner over SOP.
> +	 * 2. The port will send Discover SVIDs over SOP' if the port can communicate over SOP'
> +	 *    and the cable supports VDMs.
> +	 * 3. The vdm_discovery_state will move to VDM_DISCOVERY_COMPLETE otherwise.
> +	 */
> +	VDM_DISCOVERY_PARTNER_MODES,
> +	/*
> +	 * VDM_DISCOVERY_CABLE_SVIDS: The port has received a Discover SVIDs ACK from the cable over
> +	 * SOP'.
> +	 *
> +	 * 1. The port will send Discover Modes for the first SVID over SOP'.
> +	 */
> +	VDM_DISCOVERY_CABLE_SVIDS,
> +	/*
> +	 * VDM_DISCOVERY_CABLE_MODES: The port has received a Discover Modes ACK from the cable for
> +	 * any mode.
> +	 *
> +	 * 1. The port will send Discover Modes for the next SVID that has not been discovered to
> +	 *    the cable over SOP'.
> +	 */
> +	VDM_DISCOVERY_CABLE_MODES,
> +	/*
> +	 * VDM_DISCOVERY_COMPLETE: The port partner does not need to send a Discovery VDM to the
> +	 * port partner or cable.
> +	 */
> +	VDM_DISCOVERY_COMPLETE,
> +};
> +
> +static const char * const vdm_discovery_state_strings[] = {
> +	[VDM_DISCOVERY_UNKNOWN] = "VDM_DISCOVERY_UNKNOWN",
> +	[VDM_DISCOVERY_PARTNER_IDENT] = "VDM_DISCOVERY_PARTNER_IDENT",
> +	[VDM_DISCOVERY_CABLE_IDENT] = "VDM_DISCOVERY_CABLE_IDENT",
> +	[VDM_DISCOVERY_PARTNER_SVIDS] = "VDM_DISCOVERY_PARTNER_SVIDS",
> +	[VDM_DISCOVERY_PARTNER_MODES] = "VDM_DISCOVERY_PARTNER_MODES",
> +	[VDM_DISCOVERY_CABLE_SVIDS] = "VDM_DISCOVERY_CABLE_SVIDS",
> +	[VDM_DISCOVERY_CABLE_MODES] = "VDM_DISCOVERY_CABLE_MODES",
> +	[VDM_DISCOVERY_COMPLETE] = "VDM_DISCOVERY_COMPLETE",
> +};

Can we utilize FOREACH_VDM_DISCOVERY() just like tcpm_state does?
Then you don't need to write them again.

#define FOREACH_VDM_DISCOVERY(S)	\
...

enum vdm_discovery_states {
	FOREACH_VDM_DISCOVERY(GENERATE_ENUM)
};

static const char * const vdm_discovery_state_strings[] = {
	FOREACH_VDM_DISCOVERY(GENERATE_STRING)
};

> +
>  enum vdm_states {
>  	VDM_STATE_ERR_BUSY = -3,
>  	VDM_STATE_ERR_SEND = -2,
> @@ -274,7 +356,7 @@ enum frs_typec_current {
>  #define ALTMODE_DISCOVERY_MAX	(SVID_DISCOVERY_MAX * MODE_DISCOVERY_MAX)
>  
>  #define GET_SINK_CAP_RETRY_MS	100
> -#define SEND_DISCOVER_RETRY_MS	100
> +#define SEND_DISCOVERY_VDM_RETRY_MS	100
>  
>  struct pd_mode_data {
>  	int svid_index;		/* current SVID index		*/
> @@ -483,8 +565,6 @@ struct tcpm_port {
>  	bool vbus_source;
>  	bool vbus_charge;
>  
> -	/* Set to true when Discover_Identity Command is expected to be sent in Ready states. */
> -	bool send_discover;
>  	bool op_vsafe5v;
>  
>  	int try_role;
> @@ -510,8 +590,8 @@ struct tcpm_port {
>  	struct kthread_work vdm_state_machine;
>  	struct hrtimer enable_frs_timer;
>  	struct kthread_work enable_frs;
> -	struct hrtimer send_discover_timer;
> -	struct kthread_work send_discover_work;
> +	struct hrtimer vdm_discovery_timer;
> +	struct kthread_work vdm_discovery_work;
>  	bool state_machine_running;
>  	/* Set to true when VDM State Machine has following actions. */
>  	bool vdm_sm_running;
> @@ -578,6 +658,9 @@ struct tcpm_port {
>  
>  	u32 bist_request;
>  
> +	/* VDM Discovery State to determine message sent */
> +	enum vdm_discovery_states vdm_discovery_state;
> +
>  	/* PD state for Vendor Defined Messages */
>  	enum vdm_states vdm_state;
>  	u32 vdm_retries;
> @@ -641,12 +724,6 @@ struct tcpm_port {
>  	bool potential_contaminant;
>  
>  	/* SOP* Related Fields */
> -	/*
> -	 * Flag to determine if SOP' Discover Identity is available. The flag
> -	 * is set if Discover Identity on SOP' does not immediately follow
> -	 * Discover Identity on SOP.
> -	 */
> -	bool send_discover_prime;
>  	/*
>  	 * tx_sop_type determines which SOP* a message is being sent on.
>  	 * For messages that are queued and not sent immediately such as in
> @@ -771,6 +848,9 @@ static const char * const pd_rev[] = {
>  #define tcpm_wait_for_discharge(port) \
>  	(((port)->auto_vbus_discharge_enabled && !(port)->vbus_vsafe0v) ? PD_T_SAFE_0V : 0)
>  
> +#define tcpm_can_send_vdm(state) \
> +	((state == SRC_READY || state == SNK_READY || state == SRC_VDM_IDENTITY_REQUEST))
> +
>  static enum tcpm_state tcpm_default_state(struct tcpm_port *port)
>  {
>  	if (port->port_type == TYPEC_PORT_DRP) {
> @@ -1559,13 +1639,19 @@ static void mod_enable_frs_delayed_work(struct tcpm_port *port, unsigned int del
>  	}
>  }
>  
> -static void mod_send_discover_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
> +static void mod_vdm_discovery_cancel_delayed_work(struct tcpm_port *port)
> +{
> +	hrtimer_cancel(&port->vdm_discovery_timer);
> +	kthread_cancel_work_sync(&port->vdm_discovery_work);
> +}
> +
> +static void mod_vdm_discovery_delayed_work(struct tcpm_port *port, unsigned int delay_ms)
>  {
>  	if (delay_ms) {
> -		hrtimer_start(&port->send_discover_timer, ms_to_ktime(delay_ms), HRTIMER_MODE_REL);
> +		hrtimer_start(&port->vdm_discovery_timer, ms_to_ktime(delay_ms), HRTIMER_MODE_REL);
>  	} else {
> -		hrtimer_cancel(&port->send_discover_timer);
> -		kthread_queue_work(port->wq, &port->send_discover_work);
> +		hrtimer_cancel(&port->vdm_discovery_timer);
> +		kthread_queue_work(port->wq, &port->vdm_discovery_work);
>  	}
>  }
>  
> @@ -1773,16 +1859,11 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>  	WARN_ON(!mutex_is_locked(&port->lock));
>  
>  	/* If is sending discover_identity, handle received message first */
> -	if (PD_VDO_SVDM(vdo_hdr) && PD_VDO_CMD(vdo_hdr) == CMD_DISCOVER_IDENT) {
> -		if (tx_sop_type == TCPC_TX_SOP_PRIME)
> -			port->send_discover_prime = true;
> -		else
> -			port->send_discover = true;
> -		mod_send_discover_delayed_work(port, SEND_DISCOVER_RETRY_MS);
> -	} else {
> +	if (PD_VDO_SVDM(vdo_hdr) && PD_VDO_CMD(vdo_hdr) == CMD_DISCOVER_IDENT)
> +		mod_vdm_discovery_delayed_work(port, SEND_DISCOVERY_VDM_RETRY_MS);
> +	else
>  		/* Make sure we are not still processing a previous VDM packet */
>  		WARN_ON(port->vdm_state > VDM_STATE_DONE);
> -	}
>  
>  	port->vdo_count = cnt + 1;
>  	port->vdo_data[0] = header;
> @@ -1805,8 +1886,7 @@ static void tcpm_queue_vdm_work(struct kthread_work *work)
>  	struct tcpm_port *port = event->port;
>  
>  	mutex_lock(&port->lock);
> -	if (port->state != SRC_READY && port->state != SNK_READY &&
> -	    port->state != SRC_VDM_IDENTITY_REQUEST) {
> +	if (!tcpm_can_send_vdm(port->state)) {
>  		tcpm_log_force(port, "dropping altmode_vdm_event");
>  		goto port_unlock;
>  	}
> @@ -2149,6 +2229,19 @@ static bool tcpm_cable_vdm_supported(struct tcpm_port *port)
>  	       tcpm_can_communicate_sop_prime(port);
>  }
>  
> +static void tcpm_update_vdm_discovery_state(struct tcpm_port *port,
> +					    enum vdm_discovery_states new_state)
> +{
> +	enum vdm_discovery_states old_state = port->vdm_discovery_state;
> +
> +	if (old_state != new_state)
> +		tcpm_log_force(port, "vdm discovery state changed [%s -> %s]",
> +			       vdm_discovery_state_strings[old_state],
> +			       vdm_discovery_state_strings[new_state]);

Better to align the format with tcpm_set_state(). Put the state change out of '[]'.

> +
> +	port->vdm_discovery_state = new_state;
> +}
> +
>  static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *response,
>  				     enum tcpm_transmit_type rx_sop_type,
>  				     enum tcpm_transmit_type *response_tx_sop_type)
> @@ -2166,6 +2259,7 @@ static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *response,
>  			response[0] = VDO(svid, 1,
>  					  typec_get_negotiated_svdm_version(typec),
>  					  CMD_DISCOVER_MODES);
> +			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_PARTNER_MODES);
>  			return 1;
>  		}
>  
> @@ -2174,10 +2268,12 @@ static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *response,
>  			response[0] = VDO(USB_SID_PD, 1,
>  					  typec_get_cable_svdm_version(typec),
>  					  CMD_DISCOVER_SVID);
> +			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_PARTNER_MODES);
>  			return 1;
>  		}
>  
>  		tcpm_register_partner_altmodes(port);
> +		tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
>  	} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
>  		modep = &port->mode_data_prime;
>  		modep->svid_index++;
> @@ -2188,11 +2284,13 @@ static int tcpm_handle_discover_mode(struct tcpm_port *port, u32 *response,
>  			response[0] = VDO(svid, 1,
>  					  typec_get_cable_svdm_version(typec),
>  					  CMD_DISCOVER_MODES);
> +			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_CABLE_MODES);
>  			return 1;
>  		}
>  
>  		tcpm_register_plug_altmodes(port);
>  		tcpm_register_partner_altmodes(port);
> +		tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
>  	}
>  
>  	return 0;
> @@ -2371,18 +2469,18 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>  						typec_cable_set_svdm_version(port->cable,
>  									     svdm_version);
>  				}
> +				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_PARTNER_IDENT);
> +
>  				/* 6.4.4.3.1 */
>  				svdm_consume_identity(port, p, cnt);
>  				/* Attempt Vconn swap, delay SOP' discovery if necessary */
>  				if (tcpm_attempt_vconn_swap_discovery(port)) {
> -					port->send_discover_prime = true;
>  					port->upcoming_state = VCONN_SWAP_SEND;
>  					ret = tcpm_ams_start(port, VCONN_SWAP);
>  					if (!ret)
>  						return 0;
>  					/* Cannot perform Vconn swap */
>  					port->upcoming_state = INVALID_STATE;
> -					port->send_discover_prime = false;
>  				}
>  
>  				/*
> @@ -2393,7 +2491,6 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>  				if (IS_ERR_OR_NULL(port->cable) &&
>  				    tcpm_can_communicate_sop_prime(port)) {
>  					*response_tx_sop_type = TCPC_TX_SOP_PRIME;
> -					port->send_discover_prime = true;
>  					response[0] = VDO(USB_SID_PD, 1,
>  							  typec_get_negotiated_svdm_version(typec),
>  							  CMD_DISCOVER_IDENT);
> @@ -2421,6 +2518,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>  					tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
>  					return 0;
>  				}
> +				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_CABLE_IDENT);
>  
>  				*response_tx_sop_type = TCPC_TX_SOP;
>  				response[0] = VDO(USB_SID_PD, 1,
> @@ -2440,16 +2538,27 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>  				rlen = 1;
>  			} else {
>  				if (rx_sop_type == TCPC_TX_SOP) {
> +					tcpm_update_vdm_discovery_state(port,
> +							VDM_DISCOVERY_PARTNER_SVIDS);
>  					if (modep->nsvids && supports_modal(port)) {
>  						response[0] = VDO(modep->svids[0], 1, svdm_version,
>  								CMD_DISCOVER_MODES);
>  						rlen = 1;
> +					} else {
> +						tcpm_update_vdm_discovery_state(port,
> +								VDM_DISCOVERY_COMPLETE);
>  					}
>  				} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
> +					tcpm_update_vdm_discovery_state(port,
> +							VDM_DISCOVERY_CABLE_SVIDS);
>  					if (modep_prime->nsvids) {
>  						response[0] = VDO(modep_prime->svids[0], 1,
>  								  svdm_version, CMD_DISCOVER_MODES);
>  						rlen = 1;
> +					} else {
> +						tcpm_register_partner_altmodes(port);
> +						tcpm_update_vdm_discovery_state(port,
> +								VDM_DISCOVERY_COMPLETE);
>  					}
>  				}
>  			}
> @@ -2500,8 +2609,13 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>  	case CMDT_RSP_NAK:
>  		tcpm_ams_finish(port);
>  		switch (cmd) {
> +		/*
> +		 * The cable is not allowed to respond with NAK so this must've happened over SOP
> +		 */
>  		case CMD_DISCOVER_IDENT:
>  		case CMD_DISCOVER_SVID:
> +			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
> +			break;
>  		case VDO_CMD_VENDOR(0) ... VDO_CMD_VENDOR(15):
>  			break;
>  		case CMD_DISCOVER_MODES:
> @@ -2681,44 +2795,6 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>  		port->vdm_sm_running = false;
>  }
>  
> -static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
> -			  const u32 *data, int count, enum tcpm_transmit_type tx_sop_type)
> -{
> -	int svdm_version;
> -	u32 header;
> -
> -	switch (tx_sop_type) {
> -	case TCPC_TX_SOP_PRIME:
> -		/*
> -		 * If the port partner is discovered, then the port partner's
> -		 * SVDM Version will be returned
> -		 */
> -		svdm_version = typec_get_cable_svdm_version(port->typec_port);
> -		if (svdm_version < 0)
> -			svdm_version = SVDM_VER_MAX;
> -		break;
> -	case TCPC_TX_SOP:
> -		svdm_version = typec_get_negotiated_svdm_version(port->typec_port);
> -		if (svdm_version < 0)
> -			return;
> -		break;
> -	default:
> -		svdm_version = typec_get_negotiated_svdm_version(port->typec_port);
> -		if (svdm_version < 0)
> -			return;
> -		break;
> -	}
> -
> -	if (WARN_ON(count > VDO_MAX_SIZE - 1))
> -		count = VDO_MAX_SIZE - 1;
> -
> -	/* set VDM header with VID & CMD */
> -	header = VDO(vid, ((vid & USB_SID_PD) == USB_SID_PD) ?
> -			1 : (PD_VDO_CMD(cmd) <= CMD_ATTENTION),
> -			svdm_version, cmd);
> -	tcpm_queue_vdm(port, header, data, count, tx_sop_type);
> -}
> -
>  static unsigned int vdm_ready_timeout(u32 vdm_hdr)
>  {
>  	unsigned int timeout;
> @@ -2764,8 +2840,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  		 * if there's traffic or we're not in PDO ready state don't send
>  		 * a VDM.
>  		 */
> -		if (port->state != SRC_READY && port->state != SNK_READY &&
> -		    port->state != SRC_VDM_IDENTITY_REQUEST) {
> +		if (!tcpm_can_send_vdm(port->state)) {
>  			port->vdm_sm_running = false;
>  			break;
>  		}
> @@ -2775,22 +2850,10 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  			switch (PD_VDO_CMD(vdo_hdr)) {
>  			case CMD_DISCOVER_IDENT:
>  				res = tcpm_ams_start(port, DISCOVER_IDENTITY);
> -				if (res == 0) {
> -					switch (port->tx_sop_type) {
> -					case TCPC_TX_SOP_PRIME:
> -						port->send_discover_prime = false;
> -						break;
> -					case TCPC_TX_SOP:
> -						port->send_discover = false;
> -						break;
> -					default:
> -						port->send_discover = false;
> -						break;
> -					}
> -				} else if (res == -EAGAIN) {
> +				if (res == -EAGAIN) {
>  					port->vdo_data[0] = 0;
> -					mod_send_discover_delayed_work(port,
> -								       SEND_DISCOVER_RETRY_MS);
> +					mod_vdm_discovery_delayed_work(port,
> +							SEND_DISCOVERY_VDM_RETRY_MS);
>  				}
>  				break;
>  			case CMD_DISCOVER_SVID:
> @@ -2848,6 +2911,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  		 */
>  		if (port->state == SRC_VDM_IDENTITY_REQUEST) {
>  			tcpm_ams_finish(port);
> +			port->vdo_data[0] = 0;
>  			port->vdm_state = VDM_STATE_DONE;
>  			tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
>  		/*
> @@ -2864,6 +2928,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  				tcpm_ams_finish(port);
>  		} else {
>  			tcpm_ams_finish(port);
> +			port->vdo_data[0] = 0;
>  			if (port->tx_sop_type == TCPC_TX_SOP)
>  				break;
>  			/* Handle SOP' Transmission Errors */
> @@ -2873,11 +2938,11 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  			 * discovery process on SOP only.
>  			 */
>  			case CMD_DISCOVER_IDENT:
> -				port->vdo_data[0] = 0;
>  				response[0] = VDO(USB_SID_PD, 1,
>  						  typec_get_negotiated_svdm_version(
>  									port->typec_port),
>  						  CMD_DISCOVER_SVID);
> +				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_CABLE_IDENT);
>  				tcpm_queue_vdm(port, response[0], &response[1],
>  					       0, TCPC_TX_SOP);
>  				break;
> @@ -2887,9 +2952,11 @@ static void vdm_run_state_machine(struct tcpm_port *port)
>  			 */
>  			case CMD_DISCOVER_SVID:
>  				tcpm_register_partner_altmodes(port);
> +				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
>  				break;
>  			case CMD_DISCOVER_MODES:
>  				tcpm_register_partner_altmodes(port);
> +				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
>  				break;
>  			default:
>  				break;
> @@ -3802,7 +3869,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
>  					   PD_MSG_CTRL_NOT_SUPP,
>  					   NONE_AMS);
>  		} else {
> -			if (port->send_discover && port->negotiated_rev < PD_REV30) {
> +			if (port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN &&
> +			    port->negotiated_rev < PD_REV30) {
>  				tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
>  				break;
>  			}
> @@ -3818,7 +3886,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
>  					   PD_MSG_CTRL_NOT_SUPP,
>  					   NONE_AMS);
>  		} else {
> -			if (port->send_discover && port->negotiated_rev < PD_REV30) {
> +			if (port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN &&
> +			    port->negotiated_rev < PD_REV30) {
>  				tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
>  				break;
>  			}
> @@ -3827,7 +3896,8 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
>  		}
>  		break;
>  	case PD_CTRL_VCONN_SWAP:
> -		if (port->send_discover && port->negotiated_rev < PD_REV30) {
> +		if (port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN &&
> +		    port->negotiated_rev < PD_REV30) {
>  			tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
>  			break;
>  		}
> @@ -4848,8 +4918,7 @@ static int tcpm_src_attach(struct tcpm_port *port)
>  	port->partner = NULL;
>  
>  	port->attached = true;
> -	port->send_discover = true;
> -	port->send_discover_prime = false;
> +	tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
>  
>  	return 0;
>  
> @@ -4926,6 +4995,7 @@ static void tcpm_reset_port(struct tcpm_port *port)
>  	port->in_ams = false;
>  	port->ams = NONE_AMS;
>  	port->vdm_sm_running = false;
> +	tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
>  	tcpm_unregister_altmodes(port);
>  	tcpm_typec_disconnect(port);
>  	port->attached = false;
> @@ -5009,8 +5079,7 @@ static int tcpm_snk_attach(struct tcpm_port *port)
>  	port->partner = NULL;
>  
>  	port->attached = true;
> -	port->send_discover = true;
> -	port->send_discover_prime = false;
> +	tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
>  
>  	return 0;
>  }
> @@ -5417,16 +5486,11 @@ static void run_state_machine(struct tcpm_port *port)
>  		 * as well.
>  		 */
>  		if (port->explicit_contract) {
> -			if (port->send_discover_prime) {
> -				port->tx_sop_type = TCPC_TX_SOP_PRIME;
> -			} else {
> -				port->tx_sop_type = TCPC_TX_SOP;
> +			if (port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN)
>  				tcpm_set_initial_svdm_version(port);
> -			}
> -			mod_send_discover_delayed_work(port, 0);
> +			mod_vdm_discovery_delayed_work(port, 0);
>  		} else {
> -			port->send_discover = false;
> -			port->send_discover_prime = false;
> +			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
>  		}
>  
>  		/*
> @@ -5809,18 +5873,14 @@ static void run_state_machine(struct tcpm_port *port)
>  		 * as well.
>  		 */
>  		if (port->explicit_contract) {
> -			if (port->send_discover_prime) {
> -				port->tx_sop_type = TCPC_TX_SOP_PRIME;
> -			} else {
> -				port->tx_sop_type = TCPC_TX_SOP;
> +			if (port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN)
>  				tcpm_set_initial_svdm_version(port);
> -			}
> -			mod_send_discover_delayed_work(port, 0);
> +			mod_vdm_discovery_delayed_work(port, 0);
>  		} else {
> -			port->send_discover = false;
> -			port->send_discover_prime = false;
> +			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
>  		}
>  
> +

You add a blank line here.

>  		power_supply_changed(port->psy);
>  		break;
>  
> @@ -5864,8 +5924,8 @@ static void run_state_machine(struct tcpm_port *port)
>  		port->tcpc->set_pd_rx(port->tcpc, false);
>  		tcpm_unregister_altmodes(port);
>  		port->nr_sink_caps = 0;
> -		port->send_discover = true;
> -		port->send_discover_prime = false;
> +		tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
> +		mod_vdm_discovery_cancel_delayed_work(port);
>  		if (port->pwr_role == TYPEC_SOURCE)
>  			tcpm_set_state(port, SRC_HARD_RESET_VBUS_OFF,
>  				       PD_T_PS_HARD_RESET);
> @@ -6012,25 +6072,15 @@ static void run_state_machine(struct tcpm_port *port)
>  	/* DR_Swap states */
>  	case DR_SWAP_SEND:
>  		tcpm_pd_send_control(port, PD_CTRL_DR_SWAP, TCPC_TX_SOP);
> -		if (port->data_role == TYPEC_DEVICE || port->negotiated_rev > PD_REV20) {
> -			port->send_discover = true;
> -			port->send_discover_prime = false;
> -		}
>  		tcpm_set_state_cond(port, DR_SWAP_SEND_TIMEOUT,
>  				    PD_T_SENDER_RESPONSE);
>  		break;
>  	case DR_SWAP_ACCEPT:
>  		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
> -		if (port->data_role == TYPEC_DEVICE || port->negotiated_rev > PD_REV20) {
> -			port->send_discover = true;
> -			port->send_discover_prime = false;
> -		}
>  		tcpm_set_state_cond(port, DR_SWAP_CHANGE_DR, 0);
>  		break;
>  	case DR_SWAP_SEND_TIMEOUT:
>  		tcpm_swap_complete(port, -ETIMEDOUT);
> -		port->send_discover = false;
> -		port->send_discover_prime = false;
>  		tcpm_ams_finish(port);
>  		tcpm_set_state(port, ready_state(port), 0);
>  		break;
> @@ -6042,6 +6092,8 @@ static void run_state_machine(struct tcpm_port *port)
>  		else
>  			tcpm_set_roles(port, true, TYPEC_STATE_USB, port->pwr_role,
>  				       TYPEC_HOST);
> +		if (port->data_role == TYPEC_HOST || port->negotiated_rev > PD_REV20)
> +			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_UNKNOWN);
>  		tcpm_ams_finish(port);
>  		tcpm_set_state(port, ready_state(port), 0);
>  		break;
> @@ -6325,9 +6377,7 @@ static void run_state_machine(struct tcpm_port *port)
>  
>  	/* Cable states */
>  	case SRC_VDM_IDENTITY_REQUEST:
> -		port->send_discover_prime = true;
> -		port->tx_sop_type = TCPC_TX_SOP_PRIME;
> -		mod_send_discover_delayed_work(port, 0);
> +		mod_vdm_discovery_delayed_work(port, 0);
>  		port->upcoming_state = SRC_SEND_CAPABILITIES;
>  		break;
>  
> @@ -7031,8 +7081,8 @@ static void tcpm_enable_frs_work(struct kthread_work *work)
>  		goto unlock;
>  
>  	/* Send when the state machine is idle */
> -	if (port->state != SNK_READY || port->vdm_sm_running || port->send_discover ||
> -	    port->send_discover_prime)
> +	if (port->state != SNK_READY || port->vdm_sm_running ||
> +	    port->vdm_discovery_state == VDM_DISCOVERY_UNKNOWN)
>  		goto resched;
>  
>  	port->upcoming_state = GET_SINK_CAP;
> @@ -7049,30 +7099,113 @@ static void tcpm_enable_frs_work(struct kthread_work *work)
>  	mutex_unlock(&port->lock);
>  }
>  
> -static void tcpm_send_discover_work(struct kthread_work *work)
> +static void tcpm_vdm_discovery_work(struct kthread_work *work)
>  {
> -	struct tcpm_port *port = container_of(work, struct tcpm_port, send_discover_work);
> +	struct tcpm_port *port = container_of(work, struct tcpm_port, vdm_discovery_work);
> +	enum tcpm_transmit_type tx_sop_type = TCPC_TX_SOP;
> +	struct typec_port *typec = port->typec_port;
> +	struct pd_mode_data *modep, *modep_prime;
> +	u32 msg[2] = { };
> +	int svdm_version;
>  
>  	mutex_lock(&port->lock);
> -	/* No need to send DISCOVER_IDENTITY anymore */
> -	if (!port->send_discover && !port->send_discover_prime)
> +
> +	tcpm_log_force(port, "%s state [%s]", __func__,
> +		       vdm_discovery_state_strings[port->vdm_discovery_state]);
> +
> +	/* No need to perform work if Discovery process is complete */
> +	if (port->vdm_discovery_state == VDM_DISCOVERY_COMPLETE)
>  		goto unlock;
>  
> -	if (port->data_role == TYPEC_DEVICE && port->negotiated_rev < PD_REV30) {
> -		port->send_discover = false;
> -		port->send_discover_prime = false;
> +	/* Retry if the port is not idle */
> +	if (!tcpm_can_send_vdm(port->state) || port->vdm_sm_running) {
> +		mod_vdm_discovery_delayed_work(port, SEND_DISCOVERY_VDM_RETRY_MS);
>  		goto unlock;
>  	}
>  
> -	/* Retry if the port is not idle */
> -	if ((port->state != SRC_READY && port->state != SNK_READY &&
> -	     port->state != SRC_VDM_IDENTITY_REQUEST) || port->vdm_sm_running) {
> -		mod_send_discover_delayed_work(port, SEND_DISCOVER_RETRY_MS);
> +	modep = &port->mode_data;
> +	modep_prime = &port->mode_data_prime;
> +
> +	svdm_version = typec_get_negotiated_svdm_version(typec);
> +
> +	switch (port->vdm_discovery_state) {
> +	case VDM_DISCOVERY_UNKNOWN:
> +		/* Can't send Discover Identity, VDM discovery is complete */
> +		if (port->data_role == TYPEC_DEVICE && port->negotiated_rev < PD_REV30) {
> +			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
> +			goto unlock;
> +		}
> +
> +		if (port->state == SRC_VDM_IDENTITY_REQUEST) {
> +			tx_sop_type = TCPC_TX_SOP_PRIME;
> +			svdm_version = SVDM_VER_MAX;
> +		}
> +
> +		msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_IDENT);
> +		break;
> +	case VDM_DISCOVERY_PARTNER_IDENT:
> +		if (tcpm_can_communicate_sop_prime(port) && !port->cable) {
> +			tx_sop_type = TCPC_TX_SOP_PRIME;
> +			msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_IDENT);
> +		} else {
> +			if (tcpm_can_communicate_sop_prime(port))
> +				tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_CABLE_IDENT);
> +			msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_SVID);
> +		}
> +		break;
> +	case VDM_DISCOVERY_CABLE_IDENT:
> +		msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_SVID);
> +		break;
> +	case VDM_DISCOVERY_PARTNER_SVIDS:
> +		if (modep->nsvids && supports_modal(port)) {
> +			msg[0] = VDO(modep->svids[0], 1, svdm_version, CMD_DISCOVER_MODES);
> +		} else {
> +			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
> +			goto unlock;
> +		}
> +		break;
> +	case VDM_DISCOVERY_PARTNER_MODES:
> +		/* Not all modes have been discovered yet */
> +		if (modep->svid_index < modep->nsvids) {
> +			msg[0] = VDO(modep_prime->svids[modep->svid_index], 1, svdm_version,
> +				     CMD_DISCOVER_MODES);
> +		} else if (tcpm_can_communicate_sop_prime(port) && tcpm_cable_vdm_supported(port)) {
> +			tx_sop_type = TCPC_TX_SOP_PRIME;
> +			svdm_version = typec_get_cable_svdm_version(typec);
> +			msg[0] = VDO(USB_SID_PD, 1, svdm_version, CMD_DISCOVER_SVID);
> +		} else {
> +			tcpm_update_vdm_discovery_state(port, VDM_DISCOVERY_COMPLETE);
> +			goto unlock;
> +		}
> +		break;
> +	case VDM_DISCOVERY_CABLE_SVIDS:
> +		if (modep_prime->nsvids) {
> +			tx_sop_type = TCPC_TX_SOP_PRIME;
> +			svdm_version = typec_get_cable_svdm_version(typec);
> +			msg[0] = VDO(modep_prime->svids[0], 1, svdm_version, CMD_DISCOVER_MODES);
> +		} else {
> +			goto unlock;
> +		}
> +		break;
> +	case VDM_DISCOVERY_CABLE_MODES:
> +		if (modep_prime->svid_index < modep_prime->nsvids) {
> +			tx_sop_type = TCPC_TX_SOP_PRIME;
> +			svdm_version = typec_get_cable_svdm_version(typec);
> +			msg[0] = VDO(modep_prime->svids[modep->svid_index], 1, svdm_version,
> +				     CMD_DISCOVER_MODES);
> +		} else {
> +			goto unlock;
> +		}
> +		break;
> +	default:
>  		goto unlock;
>  	}
>  
> -	tcpm_send_vdm(port, USB_SID_PD, CMD_DISCOVER_IDENT, NULL, 0, port->tx_sop_type);
> +	/* No port partner exists, and Discover Identity */
> +	if (svdm_version < 0)
> +		goto unlock;
>  
> +	tcpm_queue_vdm(port, msg[0], &msg[1], 0, tx_sop_type);
>  unlock:
>  	mutex_unlock(&port->lock);
>  }
> @@ -8487,12 +8620,12 @@ static enum hrtimer_restart enable_frs_timer_handler(struct hrtimer *timer)
>  	return HRTIMER_NORESTART;
>  }
>  
> -static enum hrtimer_restart send_discover_timer_handler(struct hrtimer *timer)
> +static enum hrtimer_restart vdm_discovery_timer_handler(struct hrtimer *timer)
>  {
> -	struct tcpm_port *port = container_of(timer, struct tcpm_port, send_discover_timer);
> +	struct tcpm_port *port = container_of(timer, struct tcpm_port, vdm_discovery_timer);
>  
>  	if (port->registered)
> -		kthread_queue_work(port->wq, &port->send_discover_work);
> +		kthread_queue_work(port->wq, &port->vdm_discovery_work);
>  	return HRTIMER_NORESTART;
>  }
>  
> @@ -8526,14 +8659,14 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>  	kthread_init_work(&port->vdm_state_machine, vdm_state_machine_work);
>  	kthread_init_work(&port->event_work, tcpm_pd_event_handler);
>  	kthread_init_work(&port->enable_frs, tcpm_enable_frs_work);
> -	kthread_init_work(&port->send_discover_work, tcpm_send_discover_work);
> +	kthread_init_work(&port->vdm_discovery_work, tcpm_vdm_discovery_work);
>  	hrtimer_setup(&port->state_machine_timer, state_machine_timer_handler, CLOCK_MONOTONIC,
>  		      HRTIMER_MODE_REL);
>  	hrtimer_setup(&port->vdm_state_machine_timer, vdm_state_machine_timer_handler,
>  		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  	hrtimer_setup(&port->enable_frs_timer, enable_frs_timer_handler, CLOCK_MONOTONIC,
>  		      HRTIMER_MODE_REL);
> -	hrtimer_setup(&port->send_discover_timer, send_discover_timer_handler, CLOCK_MONOTONIC,
> +	hrtimer_setup(&port->vdm_discovery_timer, vdm_discovery_timer_handler, CLOCK_MONOTONIC,
>  		      HRTIMER_MODE_REL);
>  
>  	spin_lock_init(&port->pd_event_lock);
> @@ -8628,7 +8761,7 @@ void tcpm_unregister_port(struct tcpm_port *port)
>  	port->registered = false;
>  	kthread_destroy_worker(port->wq);
>  
> -	hrtimer_cancel(&port->send_discover_timer);
> +	hrtimer_cancel(&port->vdm_discovery_timer);
>  	hrtimer_cancel(&port->enable_frs_timer);
>  	hrtimer_cancel(&port->vdm_state_machine_timer);
>  	hrtimer_cancel(&port->state_machine_timer);

I see a loop: SRC_VDM_IDENTITY_REQUEST -> SRC_SEND_CAPABILITIES -> SRC_VDM_IDENTITY_REQUEST.
The tcpm should go to SRC_VDM_IDENTITY_REQUEST state only once here, right?

[   73.224945] state change SRC_ATTACHED -> SRC_STARTUP [rev3 NONE_AMS]
[   73.225043] AMS POWER_NEGOTIATION start
[   73.225050] cc:=4
[   73.225767] pending state change SRC_STARTUP -> AMS_START @ 16 ms [rev3 POWER_NEGOTIATION]
[   73.225915] VBUS on
[   73.226210] VBUS on
[   73.241806] state change SRC_STARTUP -> AMS_START [delayed 16 ms]
[   73.241832] state change AMS_START -> SRC_SEND_CAPABILITIES [rev3 POWER_NEGOTIATION]
[   73.241836] PD TX, header: 0x11a1
[   73.247176] PD TX complete, status: 2
[   73.247203] state change SRC_SEND_CAPABILITIES -> SRC_VDM_IDENTITY_REQUEST [rev3 POWER_NEGOTIATION]
[   73.247213] tcpm_vdm_discovery_work state [VDM_DISCOVERY_UNKNOWN]
[   73.247221] AMS DISCOVER_IDENTITY start
[   73.247223] cc:=4
[   73.263455] PD TX, header: 0x108f
[   73.268831] PD TX complete, status: 2
[   73.268866] AMS DISCOVER_IDENTITY finished
[   73.268878] cc:=5
[   73.269153] state change SRC_VDM_IDENTITY_REQUEST -> SRC_SEND_CAPABILITIES [rev3 NONE_AMS]
[   73.269169] PD TX, header: 0x11a1
[   73.274518] PD TX complete, status: 2
[   73.274555] state change SRC_SEND_CAPABILITIES -> SRC_VDM_IDENTITY_REQUEST [rev3 NONE_AMS]
[   73.274572] tcpm_vdm_discovery_work state [VDM_DISCOVERY_UNKNOWN]
[   73.274585] AMS DISCOVER_IDENTITY start
[   73.274591] cc:=4
[   73.290873] PD TX, header: 0x108f
[   73.296215] PD TX complete, status: 2
[   73.296240] AMS DISCOVER_IDENTITY finished

Thanks,
Xu Yang
