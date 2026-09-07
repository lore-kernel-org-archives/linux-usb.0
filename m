Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E6B3EC81F
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 04:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753793; cv=none; b=QTh6jfabXp5vO0n6wKyFeLNOJAZhAekCvsVeH0MqcbvzNybL9TkuMZ+Wq1PtV5dCacr3oTnKptE8nJvvt0GK2JAjxsUB3zFtavTOS/H0N+VwKcIfjZluJv7UrSI3NWo0NhMGT9SKg4GhtDu5qYV7p/uv7/jDH8LQ62Pzav1nazE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753793; c=relaxed/simple;
	bh=nHa62S2Fcop0tZTlAtSH7MplYDBYa+sP0sz9MET4hIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPhVgXafWslDSKIWOjXcisD4YnRsn5FzG3mop5ANFzwMljib+A+CZ4RN6B6jePed3VbvV9Sa+9Q8UfnobB0fUWx+pS8brm7AhazdeZTOkcyEy33J5NxDF/+XiojgYGSGt0252pVHZDf/liNMp08UUgUhzhB7PLBriRXkH8s1SLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5rAc/Kr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/p1RFFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5rAc/Kr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/p1RFFV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l4782820800
	for <linux-usb@vger.kernel.org>; Mon, 7 Sep 2026 04:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nHa62S2Fcop0tZTlAtSH7Mpl
	YDBYa+sP0sz9MET4hIQ=; b=Q5rAc/KrRsZVCUKuHOaqa1dHn41YqhPSjp8LrCX2
	+Rj/jmzD14q7cisqYksr882AOOov2OYEs8ZI64HbHGr3PD7ypqrO8NO1HrIa2FA4
	P26lYKppG2O/a641PTCAvVytMFzSjR0JTo9PJezMko9gyQ2hp5M8MwJE0eUTYEx2
	BNsJyckesb9c9UrtzZOh15Kg1hsKTMjRN/Lqo15G8cKnIv1YJ3f6tUyHloZNb2Zk
	udzwWClUGZ8kRyNavVkikTnr4Ho4slqKfs0BtBu6ALr3KySZdjGQak0nfdbhkrf6
	Jds81yifsmkYL214lgc+pJA2z672ZZW9OCvPY2bPLqIjmw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhmxg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 04:03:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so4132257a91.0
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 21:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788753784; x=1789358584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nHa62S2Fcop0tZTlAtSH7MplYDBYa+sP0sz9MET4hIQ=;
        b=B/p1RFFVephpB1p6vEil4vfpF0dB8QpA+9s/cPiIMpmDoKe71XmcPGyv9FU/17aekd
         zLZR/lpyGnN6O0qKbveb1kpTNDh0TMahqGHrFduW8WqJiqdxerQP4jxQ60v4YbUp0jpg
         oE/6WrkCA9JWuMuAZ9WwgrnnvrLd120iaZGyzUzNvQ6a508OgOjqa8HwJGxRu59e+2LG
         95bmkLNh2SY+PifBDvfCs6SrdigvDrEWKYaEza8uzAItJ06IuaazIszgpbLSfFCUTEMH
         3sAjlZF+xVFUJv3N51LNyxQClOJ62TavU6EoYqIBd0hz/CK+zrczDctwUFeTYakSeydK
         54sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753784; x=1789358584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHa62S2Fcop0tZTlAtSH7MplYDBYa+sP0sz9MET4hIQ=;
        b=YeqzVi75UQKFeiMZ1B0qoWNojiIwt2Js2G8rqmGp7uJ3S+zVcbr9ltZEvEvrbcDv2t
         qxSdI4k24hpBuyYo+Yz/7d6Q9YF/N01jhO1n2SL/vaZZ4lC3L6Lng4B2QGtm1zlB2rtl
         X+TUX/laWnenzSMDQLz02k7rl0D7zQLIPGz346Cy9QQ4cuLtW748Iop3hd0TvHyEGmHK
         4ocjrM5bzsR45bth0oflDxLkKMPcKxySVhxNHQmAM4Q74hjSHslOUt+45gxgt93OVyix
         cuMEXfcznNzIxvy+zbrYzmcoVrjJVy3VNPu5WrOiVubmPYpQ/S6qZjWVLuPp+A942GCe
         Gb6Q==
X-Forwarded-Encrypted: i=1; AKwUvByi0rWx+cdqsyB3Ol0V7RuA94DHGUIgrG6EdzUIKdh5lhnuSCu2Q66VB8sqU+98ulvWbj8pATGuuoY=@vger.kernel.org
X-Gm-Message-State: AFuF++lhBdrhq1JuCylhZcUpDhMDy8sPscrTda5BBw3fAWCaZVBcTd4O
	WIvPKS0aN34UDbr5hJ1kFVz4HM3D/NkyTgn/wzMbTq1GdCIP7qdDfzDWIkYyJ2RYAEsjvENmYDu
	m9eyqjsQC+1v2kl5Lv/Hs8DjKYEv4NaSvFktdWeI4R1xSMvM32CkNWDcZAIkzmYM=
X-Gm-Gg: AYBFou25v3DtV3l+5ZZuwJg3seW0mLvfyQS1ymv6BKfUWK5CBvTak86HoDBJ07v/KUj
	nV5le1Z1UokL4PNIJOlIHVfIIiWkdD2gug8xNRC3tKUee5yrDhVlfTIu+/gQgofSgCSLzHlojMX
	tTLvT2mTLVR8pqiCeMjv1y2FcrF9n2S8IAxytDG7qnAhkm0OraZb7CSrDwp2gVt90bmrZWsmDXV
	ESUuFRd1PWzMRQjwOgwmnJ3FNKepShMr4GdD2cRW6ik/nWCboL98X42vUpLYkgEoi9/Elh63/iV
	vfYFoWyf3vXBNEm2WMsczNpKj+8UV+1epHmSI3B4XAX59M/rN47R/ylYj3VsWCeXPaYZwPsvzZU
	hmea0RZ/igx9z+1pEiqTLZ8DWEWP23bbe9pRQT+PNhl3A5VQ1PW6rOftS0HtMILiBJjPfso+6xv
	7lFvNb2kv+tyZTHYt12OA/gepRhe8j0A==
X-Received: by 2002:a17:90a:10c9:b0:39b:34ef:3b2b with SMTP id 98e67ed59e1d1-39b34ef401dmr17670966a91.14.1788753784351;
        Sun, 06 Sep 2026 21:03:04 -0700 (PDT)
X-Received: by 2002:a17:90a:10c9:b0:39b:34ef:3b2b with SMTP id 98e67ed59e1d1-39b34ef401dmr17670914a91.14.1788753783888;
        Sun, 06 Sep 2026 21:03:03 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm3798517c88.9.2026.09.06.21.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:03:03 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:32:55 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] usb: dwc3: core: Allow glue layer to pass
 reference clock rate
Message-ID: <ap43b3zog8iiBgt9@hu-varada-blr.qualcomm.com>
References: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
 <20260906-ipq-flatten-usb-v2-1-dab83120b10a@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v2-1-dab83120b10a@outlook.com>
X-Proofpoint-ORIG-GUID: 6LbFKreSiAb18URMwxtUu3Rxo-7dSqmO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfX/qfePaqchYTC
 fZm6CEkFQI5Q4JkWVZxMR3TkYbeyEt8YcPM+qh7GCkm/WEzO0iBz8DT2+yW7MfNI1xfuVUWTtK9
 C9Jj+UjLNv07JfxSliFTj/hzLy6JHRk1kk0Vmiw3IjsnPcx4knndyBft6FAgmSGuTd8/dVwHOww
 HSqGbZ+VVT+oAUmwvkb5U/6waoVf6si4NgmWckEl8ZY8wI4TYgmkQmy7i3ePrPaiyNeP4KpSFWc
 sco8xbPClZFN3EYU0Dh7dCSqWsp75bk+wxGqISxlLCyjps750i7qtHXHzBZn7QRoo4ycUgRo6bj
 y89q0mLkZnyHlwSdx9G8CGvq/cxSUIWAS55k/iYv0aVQxaPqkTBa12KEJ09/lbyPx40bG5mK5QD
 cGQUAgcztNRG7IqOzd8S+hOyuKNIoFVHYC5i3PR1flBWwwweakX4naEMXARYYiKobBfGW3F9YsT
 +W5wZsrJWLcvQYjghtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfX6MIhn5a2Sfes
 EJHnBflnbQXuLRfT81OLBkr2DDgkns9uHsAsHMSyFU96cCpshZY6oUiD0GoHZIYluZ9GVrKgS5g
 S+ZOlRuqMdqf/fuurx4gI6V7k4X4H10=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9e377e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=J1aC8j_Z7Edc-Vy2RqkA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 6LbFKreSiAb18URMwxtUu3Rxo-7dSqmO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070039

On Sun, Sep 06, 2026 at 07:52:40AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>
> Add ability to pass the reference clock rate from the glue layer to the
> DWC3 core driver. The core calculates the reference clock period and
> frame length adjustment based on the reference clock rate.
>
> In the flattened snsp-dwc3 model, it is currently not possible to pass a
> reference clock that differs from the default since:
> commit 613a2e655d4d ("usb: dwc3: core: Expose core driver as library")
>
> The new glue layers (incl. Qualcomm's) set the ignore_clocks_and_resets
> flag in dwc3_probe_data to true, which disables the core driver's clock
> management, thus it also doesn't acquire the reference clock from the
> devicetree needed in dwc3_ref_clk_period.
>
> There's an existing DT property 'snps,ref-clock-period-ns', but that's
> been deprecated. In addition, basing the rate from the period is often
> not accurate enough to derive the frame length adjustment value.
>
> This prevents moving chipsets such as IPQ5018, IPQ6018, IPQ5332, IPQ5424
> and IPQ9574 with a reference clock rate that computes values for the
> period and frame length adjustment different from the hardware default
> from moving to the flattened model.
>
> So, add ability to set the reference clock rate in dwc3_probe_data, then
> have the core obtain the clock rate and use that to calculate the
> required period and frame length adjustment.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

