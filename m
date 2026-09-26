Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73463E40FC
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 10:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418433; cv=none; b=TfGkxminBp8fbEgfnsDT7dloonHBtNuoWjnCn/ymI++z6YUKFsf45YlZxcrwEZrEZ/ydXgXkw+WrfeawpEqrtY459wdGsAXsoAPA0v80+abEV/3abg9T2LmRzevWtvl/ZsyItwa2OxRgfVL2oQE/92Gfk4vwCqse+eSPZu8i+0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418433; c=relaxed/simple;
	bh=6KshC5S0xJJENeuCMTPooeE1gjZQjI2+U20rb0V/1ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7xb7wqgEZSPBDGLLQiVCb0/a/j5eUs4GCzVbmI3/UAbrWfAxEegOnZy925TBI9ze8G3BMqt3zsbPqRXtnde5D1zwmdMlQr89M+Y7In20tgo59VidNfVoMwgpyX08YW7elSFqxgFNFLIweUslDsz6sureb5HIOn7cVzgvW8Bdeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZagkcOW2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZagkcOW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790418430; x=1821954430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6KshC5S0xJJENeuCMTPooeE1gjZQjI2+U20rb0V/1ic=;
  b=ZagkcOW2Q+sqQSMQMvu/MB17KTrfzV94lg0Ir9BoICaCrvLDX7YLiXvX
   XG/gHWHeAhZvsgI30en7S5RqBecZ04LIKIlVA4UPAftyj/9i3rmG4fkd/
   ahue+79oDenMJBXnesUHwcFcPQ4EMP/eZVuTkdAgU/IdHtAqc3CsP5eT1
   vA9422IS4dJIt39LvYE6h2nHiUyq2ts9mlGyb88A6/l92GHfoaZAmHiZU
   ZuqucWlBnZZFIOma9DWph765V0juoUI/9hlTJOurMYr1fmFdk6rTIWxyU
   WGB0h5hbtK+JMdaqxG59E+BuC4Ol1VowehzomYo9XzqriIKnn8iGeosnx
   A==;
X-CSE-ConnectionGUID: sf+FZ7tvTpynoIS1/ossQA==
X-CSE-MsgGUID: Y6lPct5MTmeKHYZbR6Djjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90144757"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="90144757"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 03:27:09 -0700
X-CSE-ConnectionGUID: Kcn4H0bgRae/AqmUIRjyfA==
X-CSE-MsgGUID: fNJD4hx2RBG4Amb0yCnUeA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 26 Sep 2026 03:27:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 86DE699; Sat, 26 Sep 2026 12:27:05 +0200 (CEST)
Date: Sat, 26 Sep 2026 12:27:05 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kurt Lieber <kurt@lieber.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
Subject: Re: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Message-ID: <20260926102705.GD106095@black.igk.intel.com>
References: <20260924073514.GM106095@black.igk.intel.com>
 <SJ0PR15MB4696C6AB0D4FB7C86C420008A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924101046.GN106095@black.igk.intel.com>
 <SJ0PR15MB46960A6F15BCA58C0726C908A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924125729.GP106095@black.igk.intel.com>
 <SJ0PR15MB469651A447568D8E66757EB1A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924145447.GR106095@black.igk.intel.com>
 <SJ0PR15MB4696FC97236D81E59D40E142A3802@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260925050124.GT106095@black.igk.intel.com>
 <SJ0PR15MB46968FAE6C8D0A6A250C5ACBA38F2@SJ0PR15MB4696.namprd15.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ0PR15MB46968FAE6C8D0A6A250C5ACBA38F2@SJ0PR15MB4696.namprd15.prod.outlook.com>

Hi,

On Sat, Sep 26, 2026 at 07:02:01AM +0000, Kurt Lieber wrote:
> Hello, 
> 
> On Fri, Sep 25, 2026 at 05:01:36AM +0000, Mika Westerberg wrote:
> > I just tried on my side MTL/PTL + BR Hub and works fine with CL0s/CL1
> > enabled. Also checked release notes of the NVM and there are no mention
> > about issues with CLx with the one you are running.
> >
> > There is one more thing that we can check though, can you run:
> >
> >   # tbdump -r 1 -a 1 -vv -N 1 PORT_CS_18
> >
> > and provide the output?
> 
> Route 1 is not present on this boot. The dock enumerated behind host
> port 3, so it is route 3. The upstream adapter is still 1. Read with
> the dock authorized and thunderbolt.clx=0 (tbtools aa0b1be):
> 
>   # tbdump -r 3 -a 1 -vv -N 1 PORT_CS_18
>   0x00d2 0x00f03510 0b00000000 11110000 00110101 00010000 PORT_CS_18
>     [00:07]       0x10 Cable USB4 Version
>     [08:08]        0x1 Bonding Enabled (BE)
>     [09:09]        0x0 TBT3-Compatible Mode (TCM)
>     [10:10]        0x1 CLx Protocol Support (CPS)
>     [11:11]        0x0 RS-FEC Enabled (Gen 2) (RE2)
>     [12:12]        0x1 RS-FEC Enabled (Gen 3) (RE3)
>     [13:13]        0x1 Router Detected (RD)
>     [16:16]        0x0 Wake on Connect Status
>     [17:17]        0x0 Wake on Disconnect Status
>     [18:18]        0x0 Wake on USB4 Wake Status
>     [19:19]        0x0 Wake on Inter-Domain Status
>     [20:20]        0x1 Cable Gen 3 Support (CG3)
>     [21:21]        0x1 Cable Gen 4 Support (CG4)
>     [22:22]        0x1 Cable Asymmetric Support (CSA)
>     [23:23]        0x1 Cable CLx Support (CSC)
>     [24:24]        0x0 AsymmetricTransitionInProgress (TIP)
> 
> The host downstream port on the other side of that link:
> 
>   # tbdump -r 0 -a 3 -vv -N 1 PORT_CS_18
>   0x00ae 0x00003510 0b00000000 00000000 00110101 00010000 PORT_CS_18
>     [00:07]       0x10 Cable USB4 Version
>     [08:08]        0x1 Bonding Enabled (BE)
>     [09:09]        0x0 TBT3-Compatible Mode (TCM)
>     [10:10]        0x1 CLx Protocol Support (CPS)
>     [11:11]        0x0 RS-FEC Enabled (Gen 2) (RE2)
>     [12:12]        0x1 RS-FEC Enabled (Gen 3) (RE3)
>     [13:13]        0x1 Router Detected (RD)
>     [16:16]        0x0 Wake on Connect Status
>     [17:17]        0x0 Wake on Disconnect Status
>     [18:18]        0x0 Wake on USB4 Wake Status
>     [19:19]        0x0 Wake on Inter-Domain Status
>     [20:20]        0x0 Cable Gen 3 Support (CG3)
>     [21:21]        0x0 Cable Gen 4 Support (CG4)
>     [22:22]        0x0 Cable Asymmetric Support (CSA)
>     [23:23]        0x0 Cable CLx Support (CSC)

This is the smoking gun! Thanks for taking the dump from the other side as
well. CM guide actually says we cannot enable CL states if this bit is not
set. Can you try the below patch (without clx=0)?

diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 35ba8abe9ece..677b059cf088 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -391,6 +391,7 @@ struct tb_regs_port_header {
 #define PORT_CS_18_WODS				BIT(17)
 #define PORT_CS_18_WOU4S			BIT(18)
 #define PORT_CS_18_CSA				BIT(22)
+#define PORT_CS_18_CSC				BIT(23)
 #define PORT_CS_18_TIP				BIT(24)
 #define PORT_CS_19				0x13
 #define PORT_CS_19_DPR				BIT(0)
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index f02c9f646833..1ce001c37c23 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1662,7 +1662,11 @@ bool usb4_port_clx_supported(struct tb_port *port)
 	if (ret)
 		return false;
 
-	return !!(val & PORT_CS_18_CPS);
+	/* Both CPS and CSC must be set for CLx support */
+	if ((val & (PORT_CS_18_CPS | PORT_CS_18_CSC)) ==
+		(PORT_CS_18_CPS | PORT_CS_18_CSC))
+		return true;
+	return false;
 }
 
 /**
