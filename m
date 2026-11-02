Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633732;
	b=bCIdSus+Vi3oxZlNLq6Uj0CQACcd+jWjqQBryjdQ8pgLfnPVgtEIyCgBFTgP1wdzlJyB
	 9OPhsJv3l8L4IkrhLM9VBYetA9es3ovShHPMZcOSiFRxCpJ5eC9BxfM3IwQvCaxY8UlOP
	 O4WhNzCCC2J+2TGbo8qQAnEF9F9vcgjT6gLP/HHO6aE7Ee14XP3cj+vSth9qezI1zzHYJ
	 r0wqPNiuGbgsFQ8dsSeMRrsd/x0Wd5s79SBmLR/WB5aM4zga+BpU7c4m+g6M4ApsUy57t
	 uoaAUCYkZiGAbHTIJQgi+00XYqjH5/iKlTkCVWvdFU7XPewKBgS0/pmuXHIioeM2peg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633732;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=qRgN1f0KQ7N1GXG1/GJrev9pmdf1U07NfXhkeyJNx1w=;
	b=iuvfAvu1qXxCZDLbPOhARZhu8/qHLAJIBUB6g6es4XpjQGER83c03YV+DgyGGCPPnYr5
	 WBySqlyjZUCwb6uo0qDzhB0XK8m/vyEuA9hGj2rP7OUptN/OHb2QM2TubBkO0NaQWewKt
	 h5o0qo3OOcbcVEMTatrOgSDGea59E7oF+O/nr7lj5awVTUf9onYz6wcU678D/77/DNrqQ
	 4kxeXkOOX/cLvvwh85X3IGBub3LCTcEoHbfDHnEcgyLwfuTlUheFWe3DJbHDibAihFkYW
	 4d3gKhHjOAh3igKS7ie++uXGOcc+hZxb06IcPZZmX7ksdW6OkltLNQ2og2V9vd3iWmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nFqmmijd;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AA860A1880
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 15:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88AA860A1880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nFqmmijd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793633732; x=1825169732;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3hByYEvxyKxN0heTV94iiOLo5AigK5YBaDE0c21TKyM=;
  b=nFqmmijdgBAZHPcVgl+yLcY+S8vAOSrhAtKnGaR0qxR/NujVqtrFvNpC
   TyqW+OW31tCyuLVv9gTSnGAM0qaOsVAmoGAwNok7ndsHMQ9VVvbp8Ki6s
   g0WT/v1B1fne4kQCHpt0IE5z+2C7nGWp07g8QnDdBLhkJ8mH80+z/fQPq
   SaVmP9cqum/vzmk4KVmYp4wVV3gBlQEyc6ZPJ6zu7Hg7UIhFbRHyL3D75
   U9iFa3gYzcKEpu5qvMMuYZ1nkY8XbjcylpMk+p/5k3GwwCJcHkVuaFWYo
   Xku/80w9ahrjlT4DYucJgj5O2sULBFFde4+TG1izl5vLdvVZVou3fQRdu
   Q==;
X-CSE-ConnectionGUID: ACs6syDUSh62sPBaYppCaQ==
X-CSE-MsgGUID: 9HEGIOCiSUyN0Ba2TRvLHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2340525"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2340525"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 07:35:32 -0800
X-CSE-ConnectionGUID: +OZGh8UdReGHUttT+qnaQw==
X-CSE-MsgGUID: DiQIOs8dQMaFp7q5dSk4XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6064745"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.244.210]) ([10.245.244.210])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 07:35:30 -0800
Message-ID: <2b7017e3-2a3a-4ddf-8a47-54f85174893a@linux.intel.com>
Date: Mon, 2 Nov 2026 17:35:27 +0200
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xhci: Gen2 root port links reported as SuperSpeed when port
 capabilities have different PSI tables
To: Anton Bulakh <him@necauq.ua>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
References: <8a954797-4eb4-44db-b53f-6e83f4b7b03a@necauq.ua>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <8a954797-4eb4-44db-b53f-6e83f4b7b03a@necauq.ua>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 21:17, Anton Bulakh wrote:
> Hi Mathias,
> 
> Preface: I am not a kernel developer and this was obviously LLM work, but I am capable of reading and basic reasoning *before* sending up a report and I believe this is real, especially as I was part of the loop in testing it with the devices I had at hand and running sudo commands.
> 
> Additionally, I had it search for similar bug reports and this was not reported yet seemingly (it searched way more than I ever could've myself).
> 
> The LLM wrote:
> 
> On an AMD X570 board (Gigabyte X570 I AORUS PRO WIFI, chipset xHCI 1022:149c), devices on the two Gen2-capable root ports always show up as "new SuperSpeed USB device" with speed 5000, but the link is 10 Gbps. Seen on 6.18.55; the code is the same in mainline and for-usb-next.
> 
> The controller has four USB 3.1 Supported Protocol capabilities with one port each, and different PSI tables (debugfs reg-ext-protocol):
> 
>    cap  PORTINFO    port  PSI
>    01   0x10000107  7     0x00050134 (ID 4, 5 Gb/s)
>    02   0x10000108  8     0x00050134
>    03   0x20000109  9     0x00050134, 0x000a4135 (ID 5, 10 Gb/s SSP)
>    04   0x2000010a  10    0x00050134, 0x000a4135
> 
> PORTSC of ports 9 and 10 with Gen2 devices connected:
> 
>    0x00001603 Powered Connected Enabled Link:U0 PortSpeed:5
> 
> xhci_create_usb3x_bos_desc() builds the root hub SSP capability from one port_cap only: the first one with the highest revision. All four are 3.1, so it uses cap 01, which has only ID 4. get_port_ssp_rate() then finds no sublink speed attribute with ID 5, returns USB_SSP_GEN_UNKNOWN, and the device gets USB_SPEED_SUPER.
> 
> The link does run at Gen2. A SATA SSD and a USB flash drive behind a VL822 hub read 849 MB/s together with the hub on port 10, and 425 MB/s with the hub on a Gen1-only root port. Devices behind the hub are reported correctly as Gen 2x1, because the hub's own BOS lists 10 Gb/s.
> 
> A possible fix: build the root hub SSP capability from the PSIs of all USB 3.x port capabilities, with duplicate speed IDs merged (the PSIVs agree here).
> 
> This can also explain the 10 Gbps hub reported as 5 Gbps on an AMD root port in https://bugzilla.kernel.org/show_bug.cgi?id=218943.
> 
> (LLM out)
> 
> Feel free to ask for more info (I wouldn't know what else to provide) and I can test kernel patches if needed.

I think you are correct, but building the descriptor SSP capability from all USB 3.x
port capabilities gets a bit complicated.

A simple improvement would be to base the descriptor on the highest revision port_cap
with largest number of unique psi counts, or if the default port_cap is
available (psi_count == 0) then use that.

code below should do that, does it work for you?

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 470bafe1802b..052d4a89019e 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -59,13 +59,18 @@ static int xhci_create_usb3x_bos_desc(struct xhci_hcd *xhci, char *buf,
  
  	/* Create the descriptor for port with the highest revision */
  	for (i = 0; i < xhci->num_port_caps; i++) {
-		u8 major = xhci->port_caps[i].maj_rev;
-		u8 minor = xhci->port_caps[i].min_rev;
-		u16 rev = (major << 8) | minor;
+		struct xhci_port_cap *cap = &xhci->port_caps[i];
+		u16 rev = (cap->maj_rev << 8) | cap->min_rev;
  
  		if (i == 0 || bcdUSB < rev) {
  			bcdUSB = rev;
-			port_cap = &xhci->port_caps[i];
+			port_cap = cap;
+
+		/* for same revisions prefer a default psic 0, otherwise highest uid psic */
+		} else if (bcdUSB == rev && port_cap->psi_count != 0) {
+			if (cap->psi_count == 0 ||
+			    cap->psi_uid_count > port_cap->psi_uid_count)
+				port_cap = cap;
  		}
  	}
  
Thanks
Mathias

