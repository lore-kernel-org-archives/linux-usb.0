Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E24543E4BC
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514099; cv=pass; b=bTyYex/K1HJYtBwxYHKvTNkeaF4qKLlBC5EQaRyRdqjW1m7kVzyi4UAFrXkbZeTIl0myvUIUkxVqGwwh4OSXtFXpFaKqm88hyAXCax+Er8XbSIlrL4bVcvqYWLxxd7S/dMVU4CqnAdw5JfSWhwQc5R4QUyPHPiCTwB2eLq5NmgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514099; c=relaxed/simple;
	bh=t7Mfn0W4w4XY0FLGa4OkOc1sfLLtw4F9/pvjHFfLZbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqPly5NeLOTyjDSzG0yL+Y7My6K+jl6VUfRRnN20TNh7bW0o+tCdtmz8ys+hEBO8exzhUoUKLRc8rErK++3MQGYTVpmriH0+JMIr5tAgiz4+tiDQtuReaTWu7YfyXbPb0zgrq54zKWXtItQiq2pBiqHJrHHoAH22XFz6jhv6khI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMuedQkG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6W9kOSr; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMuedQkG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6W9kOSr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3AnV2605453
	for <linux-usb@vger.kernel.org>; Wed, 8 Jul 2026 12:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V2rP6/5iwyNedxrAgz7W1q4QPqfgHeOR17nfOUVlEMU=; b=cMuedQkGV9F4X/Cu
	m3IvHFPePdXQXXl+ORKLRDC/rg0bQktMj5GEKNGROmmfKNkICPECmQ8je0KOzLsj
	Vk/RmA4egSqYo8qs/gUz5vUVTQRjqCFQXalkw5Q7suR+BlC9dZj1vBAYoulQIycz
	TUkKN3+LtMe1yN3lW2p+yHqvkgihjS3rvs8nt07Wdx0CvJ3lZIEzMpc4AukIt2De
	C1feUKmDS/0uejN7QHkyLDrzM/DXHey2zYWCvjvvPguE8qplgvyVOw261fNmaeBz
	V3RxtiZwZ/KimLouuxSFC/G4SZjEQyDr688AHOjwHCu2l7dk/h43cs4fapr9qdcN
	Jp4gFg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5am8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 12:34:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e9489f62bfso13010666d6.2
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 05:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783514096; cv=none;
        d=google.com; s=arc-20260327;
        b=BtinB0CCti8PBzgkoPm+DOmTO6jlUNI9hkYAGTAvgmuCfHOhTOb2cytPbpdGYljryn
         FTXfFmNB+y/vPRuCMWjD5m7Oy2ZPk7gQb7eZ7UHd+pihb2TgU6ia2fpGCQQ1jPvd9du6
         1NS62JcKv45g0NDzVMw1XEIWM5wJ9JeEMsU+dqJSoqPCxObK1ijZLcYqtArKu6KBO+Hp
         3cbVT1LdBvdmLZzfx4tvyKYwHtqeoBSKnx3h6GLfY60o5SYOVxi1INKYUMMsZPFscA6a
         LK48Ds5MwJB6x0ZGaD9zw1+vES/8cyexrSDwvM31lNxIH9r+MmuaQAFx2tBa1o185RoA
         /LbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V2rP6/5iwyNedxrAgz7W1q4QPqfgHeOR17nfOUVlEMU=;
        fh=ygtO98yJOWEnF4G8BZ3gosMvYJTyIIi6XsEc/qfLQNw=;
        b=B9GxvBnEwPzjInuFsFsqo0S2he1TdxtmVelF9aub1j7qYA3YpbfsgrVDD3F4XpFEVH
         Qxjgi0kPJXbxAaGYfzHtFUj65EgnxHB7jVqAbOzrp2G5O2HA7ZSTPttLLMuhd+5lx0Rk
         qOYDxCoe3Aqr30/MkxgUXUDW6vdRD6StYzhu/WMg7z1RmNhwtZ+xMXu3sPxhUj4xc/b4
         VTuEVHUDV6jiKtV2m+hS9IffEvrBJpNo7mf7GpGQEiiOQKD4104Qe/nnaY+wp+CZjKeU
         1Gz97Fj5/B4nm+SdrhuKD1y6yaknhwraiY+Clyy6jb94YVeeuK59QyK6hZaFoZVuTP73
         ndEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783514096; x=1784118896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2rP6/5iwyNedxrAgz7W1q4QPqfgHeOR17nfOUVlEMU=;
        b=F6W9kOSreqbPXOcN0zt5U+KT8azP8phlFgVuoCzVVUTQadyTpC9kFDUQ8z/o9X4Vo6
         JlNlkptrwnG44Rpt3oEBAbHvIfC00BcIUx6Ig9eIVYb99NWNcy4/6OMBZt5sr4F+qQIk
         8nYYZHsn3XtJsJtvYhbL6cFNZA/iMGbne57NZTMbamxrwP/r7Qen8T/lMJOZDx9lq9PO
         wTUg+bFrsn9acFPG1NUxTjR1dQ2l1ZuzzXmqkpvAqDUHdNrKUxY08h97hfXFnTFLpywr
         IVAbC4afM4L2RZWPDTro7Nv/VfWB2Du32Ro6OczrhLSiDdRpelTa5TiO+RBkOLgy+u6w
         UzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514096; x=1784118896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V2rP6/5iwyNedxrAgz7W1q4QPqfgHeOR17nfOUVlEMU=;
        b=BloXGXPpmfBk5/MnJTDsE5BGhah4pqFWQcFkH0B8Ihk61iTBmX4yoZrsxzqyYRjAIZ
         liLjCEjpshdh89zNcRU/X3PcJLNOmS6zX6fJ10vbq0wtSQ7eGwNA2B5cNbcCM6Bzfd4j
         epG5yP2W45Qg1tLn62+Yne/JOoltZc+xM+YbHXcadFK7JtTTBIGL7edVxTI2prM9ppQV
         2Cqa3YIdtssWYFHL+ACd2Mpq5n/c77vC1pQi1Baa1glD/k7Pcn5C2VF4loF7RpdFhkAe
         6rhFSJqrQS77n3vIbJg8NlcUFxVhcb6pi9YhYkcvy79vPXxng15GPdQ5cjCX2dEt6/7g
         YiiA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+bxN3fptAxNAUxTjHkDAUeMq6vvF+CORkO+HFYvc/ETi4Ql4Cz7Z3ki8xtBovSoVmQmtML0fBD78=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMgJEpYXIs7jA4FppkVIgg4sliZok/jlyb1EN8Hv/IALEqOQrw
	2soNPeZAnRCtMGgTBUau4gTG+TIvU4lOcRT0vGch2GcUtDiZ5xkXyRDXuqC9jXqZwWDHNMYjt3O
	sdRwUIBLVLz2qT46UZJByP6onhBw9JsVzImvcggT5ItUHRiTAVpyDZgzaPm9l+HUVlflVCHAjXg
	ogsggLgXW+qB1GcG/wt2yxHZxXFCf50exaxRP1/g==
X-Gm-Gg: AfdE7clhsYMRePcmq0Qz38rdUHpmFYeAf8MRCToO969gSftBG2s0Trt60GX5ojP7CR0
	FbsUuFb7fwRdCqgfx2H5sE+WmbJC3Quy1RAUNv9IfJyzVP4bexMWrQk+eYCqB9NYblLnvQmOQ7x
	MxkiqqcLVjhF4tVxlUvdZCacA5gk/k1A8WoQ81iIl4cWmInXwfjO0tRvbrDJpUgH8rRzwEyZrgZ
	NqW7Xe9gN9uznNs/PWWYqH86Jp9eGC+Gaq/XEQyC7VQLdf517b4D3fmOmhASDE8gO/akathGJCG
	dKXQCAv7DA==
X-Received: by 2002:a05:6214:76a:b0:8fd:6de3:bba7 with SMTP id 6a1803df08f44-8fec46e04ccmr20642046d6.61.1783514096311;
        Wed, 08 Jul 2026 05:34:56 -0700 (PDT)
X-Received: by 2002:a05:6214:76a:b0:8fd:6de3:bba7 with SMTP id
 6a1803df08f44-8fec46e04ccmr20641846d6.61.1783514095900; Wed, 08 Jul 2026
 05:34:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630130147.1385145-1-loic.poulain@oss.qualcomm.com> <2026070844-placate-routine-593a@gregkh>
In-Reply-To: <2026070844-placate-routine-593a@gregkh>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:34:44 +0200
X-Gm-Features: AVVi8Ce3oqF4J97dpucxGBIHn8R3mHAjTxLbovTg8t_qQrbnNqp0hmcmHf2ydNg
Message-ID: <CAFEp6-0rRSfWyYngQYGLQUa3b1WF0=GCxXAPUzEPBus5spyj_g@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: ccg: Log firmware version and hardware
 info at probe
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org, johan@kernel.org,
        akpm@linux-foundation.org, andriy.shevchenko@intel.com,
        pooja.katiyar@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e43f1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=ag1SF4gXAAAA:8 a=X1pMknb8agl1iAIB3kgA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMiBTYWx0ZWRfX5y7fBH1XpYVZ
 O6bKzd0al8Xr5CWCFr5VeWNMeqbzInVyiDsNBZiKVUSduPNscFJgxyjOSlEnSlnGjCevLjhxGr+
 vOgV2M2mlcFzCciJzjI0zUNZwHt57Tk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMiBTYWx0ZWRfXz1+UKtXqDtxd
 ne5FgP/CWqOpp2HgpgYyaL1dH6l6+82FSCeswvGQiwJ+KjMg89oZfd6tIPUgdPpECAK3DcZcnPE
 pRoUhFYLGEqYgUXg6GPv7jBMllgQ4o1lYJl4bT04dk3LmQvaixvdkYm9N57Sd8MXHlYu8uE61PC
 SpEvzCAkhrv61SJEAzHbnetVFrc2yBisAOe9FmKOQD5UP2SIr2QiW5QVty1rSYgB2rHsNO56hoO
 h0utcuILY+mKymS6T3Hu/aWANzBDTsrGzGI4wcaediz+rWhw7sYFgLk/d++U4q9OfKPe2BRi0Vb
 g9PgWLgIQjjmEUqEZpMrkm4XxeDQgqzOrB1QbEoZP3v74fSfqa7tsuxduZ2Ko83N2MgTuPNqPcd
 eYzgchu+W+1t0l2Yrpqrr8MZrUN1Byj9j6FjM2rJuuXRiYkNCnXFQbWu3vrmw67p0/e1Clsp6Rv
 /jrfwnc2pAFVrLKEAjg==
X-Proofpoint-ORIG-GUID: 6GctFJPD5RjFmyrz8Sg_rvQ2gGssoJYf
X-Proofpoint-GUID: 6GctFJPD5RjFmyrz8Sg_rvQ2gGssoJYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080122

On Wed, Jul 8, 2026 at 1:48=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Tue, Jun 30, 2026 at 03:01:47PM +0200, Loic Poulain wrote:
> > The CCG firmware version and silicon ID are read during probe but never
> > logged, making it difficult to identify the hardware and the firmware
> > running on the device.
> >
> > Add dev_info messages to display the firmware version and silicon ID:
> >
> >   ucsi_ccg 2-0008: CCG FW version: 3.9.0 build 0x0000
> >   ucsi_ccg 2-0008: CCG silicon_id:0x1234 mode:1
>
> When drivers work properly, they are quiet.

If that's ok the simpler is to move to dev_dbg.

Regards,
Loic
