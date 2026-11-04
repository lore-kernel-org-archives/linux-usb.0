Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787543;
	b=WmrxWfSW+cv6KP5AaRqBhRaQEYOMknec1Mfa9Ga0rrf693cDJYAbn5WZ/bdOedpXsU6A
	 JbUe2UvZP1EC0oUUSxY5ZiIqr6fAAHRd8esnoqXrUjVOswkiBIj3GdK9S0ccabzw4QxND
	 K+X1i2Lr7TP2CXNAt9Dml4RX0Dq/Cz/cDPynV2lO9Jd7XcjSTSccc7UKTWyQaprggzNs7
	 vu/y+0RGPtG6vfaRB+xv8EIL/Qq/OItbss/noCLNe/lxfQaMENKQl2Z6+Tdp9b5RHi1oi
	 p3U0WgpMgcAvNi23Otvam/z9ERBuGwXwYjEI72llykWX49qxW7bAwVE7GXpACXDZf+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787543;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ONMLQJ0flZncxgsfw4m5Fbdj6Ih2uP7SZPVhEVV1DRI=;
	b=g0fhW0Fk73fIlxIDbslodfDzgytu/zo3N32SS/fRcS3x8C5HX2VOe1cS2axdGAojIiVa
	 mpNNI+G7VBB+FVqPfqWa/jE7PYFicmNDiJrFjteUlxBXDQD1bbPeQnPjeHXYiOY+YXTov
	 aMI2PgaTmK5JMr+iyeFr0WXnrycWwVFfbXHrcZsF+Frgk4mJDxUa0qs0f91jvmSxrdl0g
	 j/C5dCjJjiPDT1KWc+UCJ1Z4YFwAsz3zqzp4DQNZ2Hq3iNa4zDK6JCYRYz6290KHWRiRb
	 5TI51uOkgBA77XQM6m0gQT+BojmI3KET8M9X3uGpLox13MHTCkYKH2e5KskIGAIBCbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eEbNyFav;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRDQ1fYO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1447B606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 10:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1447B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eEbNyFav;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QRDQ1fYO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KNMV2290393
	for <linux-usb@vger.kernel.org>; Wed, 4 Nov 2026 10:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ONMLQJ0flZncxgsfw4m5Fbdj
	6Ih2uP7SZPVhEVV1DRI=; b=eEbNyFav6Symp0zg+Z+qyfYjd9rwyIB2wfEUyw/u
	RLEEGz9B0L5gDBSGpToVFMl6iUL8YSf3M7UB1f1VMjmI/JJ/l/PpRNt6PcFjnED9
	wX0qyeJU3Gi+txt0CZ9wFDMqwkomcmjJQcdVMz3GgMiKK5PWi53Q+6vE/tQm1NsO
	VCHyTATTFMPOkdrsPu0rXtZ4iUrZRyKFXC7ivPmidWbbc7iYIqDYC2MPdRaOPAFV
	vDGbviC7z3ihol5XEVOOSklXGnuaZskPmWZjac8CE6HNbanXCqVqLEYz+1vBuB8w
	XkE45Vvc00t8kzYPlczOiusq/QTG7pFT2v2Dgv76N10/sQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuvavct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 10:19:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so1991246eec.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 02:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793787541; x=1794392341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ONMLQJ0flZncxgsfw4m5Fbdj6Ih2uP7SZPVhEVV1DRI=;
        b=QRDQ1fYO0coxDuTcZ50VRQWs78vjYXQxs8YccPYdVox1LPSGlVxvVsXnOX8CZEVReG
         AClroXZc4Gt51Z7pVPbsvg5V0vv4ps7JTN7Mrsaz1u7ZBk3IYmKGGnBP8pBuCE20t6C9
         yVmLWk8tSTaWGP7IMQDFcp53rwsuKPMq0EMp/DLO7+VOul8t37vdHxpctCBaEyQBgwoF
         M1pRV/3vWzZi7qGtmHzvkfFW2Nlk+pdcVFEqQxLgkKQTtYvnhVHHTar8JyipnM9IThbf
         hG06XYK38zj/2yZZ4UrRFz30WPFu+VnL0RNf3FZWLyiLCx5zsp1mf3UNPDWmVkdD7JNy
         TofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787541; x=1794392341;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONMLQJ0flZncxgsfw4m5Fbdj6Ih2uP7SZPVhEVV1DRI=;
        b=kL2EewNArBjdttakYA+YR0/F5U5/FtRKV1NqozNyJpyLnDiPDAAYA4bSwt+NdvJPmt
         vJPqSdw29CyWqK8NeScYR2fRSlFsvoXQmeiHfGXaNuZC3Z/vyWTtrKoZzX+YJPjzpsRi
         UTilsH/TVNaEWsG/PQeqV+b8l/IErpp0Yex6a5pPb9xbyCjbvs9wsjopGAO/DaGlZVPk
         kr8cWZuky6p2acCRsptY0cHposCf0RGR064pJV2F52LEcGj8wQLBEM79DVzi25JSUMp4
         Y2Seg3oOKcLkSKzXjlp79WnqsJ0SY5aRE3jd7xdrmGIKugOlyBQebT2tDWFu9K2plu8U
         ORww==
X-Forwarded-Encrypted: i=1; AKwUvByx6+qtTqLrOmU8dn5sIattBzANI6M+hJGPUNZNwWbV3SSmND7Z/vu7MjeW9/wMjfzwvX/RQJSs7Cw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wPBuQo9AoEL8bs3zQGdFq/mvMTBdYXNlJvUd9GfelgrFkp+7o
	OgC6oZ3SH2xN8NX5JAqSYv9vD/H6qU/bSCS3Evbe8QaVxbPhs3u0HAeMwsKPI3gWiZfy6H0Bpv4
	P9LDaib1evsvFMZaJNE8PVAavm+Li7aUGbyp2M7gQQOeF1d8NmL8y9frUr/1/WwTe1uT+ZhmiLw
	==
X-Gm-Gg: AYBFou2jtGBolBj/q0YistgDKEaJOqD8bTLeBccAcmcunfOb2+g1GiULa5USj2lifLx
	9YFopwAp5m3rJ3IVR/ChVWeFlOl+Y//6fTZmc4Vin0D3c0Cq3fNqTB3zHiwB6GpyCia5CFLU+/V
	bS+n31dbXpAOz82++6U14deqNHA+vHczHQIuCabbWHTh9ugM2LE2B8J1fgSyKIOsnaTrybHubQT
	biD25VTdG71w2Yurn9MmJAJ3CTlAdAPMUTel9pFUb6hTVszRIBJHWjus3+sNkB9M2oNS9mKAsCL
	HeX9CvcfU2xJ8ri3Eoc7XsylMXbOwGs3+8N04/UYto3jMJBZG+ERxGy9m5o4I5InmPnXcw6/F08
	ebYgWMPskYQYXzVF8KltaryBNVmcWkXY+wyTp5w2bQpLiMO9hNzkXhq0GvbuQpa9NBjBRIbWQHl
	t3JIbJ30h1R72jra7xdajc
X-Received: by 2002:a05:693c:6312:b0:36a:1709:458 with SMTP id 5a478bee46e88-36a423cce1fmr26887441eec.27.1793787541330;
        Wed, 04 Nov 2026 02:19:01 -0800 (PST)
X-Received: by 2002:a05:693c:6312:b0:36a:1709:458 with SMTP id 5a478bee46e88-36a423cce1fmr26887409eec.27.1793787540554;
        Wed, 04 Nov 2026 02:19:00 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm7629522eec.2.2026.11.04.02.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:19:00 -0800 (PST)
Date: Wed, 4 Nov 2026 02:18:58 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Wentao Liang <vulab@iscas.ac.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: cdnsp: drop runtime PM reference on gadget init
 failure
Message-ID: <ausGkqgA4s0qfOoi@hu-petche-lv.qualcomm.com>
References: <20261104021503.1468519-1-vulab@iscas.ac.cn>
 <aurm1tM212A8jOSk@hu-petche-lv.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aurm1tM212A8jOSk@hu-petche-lv.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeb0696 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=XCz_lG5Kgad_7SUZ2voA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: nDd76xnk9Um5yWgHm2gDHnsM6aj6IWfq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MCBTYWx0ZWRfX8sABFGPM+r7J
 JBsCfXe7AtN8x3ry0sx+6ThiT3jvkrasglpBIDNBUycrjSVrFL01fEWVdal7TNdjtTsRtUMODV1
 KWMODKShxejunDCDbVJ4FtWgWQUXq+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MCBTYWx0ZWRfX3+W8iG1KSWtn
 UGFYjJoG96Y++htPZdqbp+iQ32XeEqdCKyEzREkbr+Z8oU/uJfwmXgS1weUkPosh7+reDGgAqlv
 AxVXPZJFLm5H8QN3HmztW3c4qywF3tpNEiSxu2BiqdN5JbUg8jX8VIbxS2UtVIGS8DhunK/1HaH
 17Oc1d0aKPV/zKoDHeJ7ChmZiVhqHrkkGKU519QcEq8BJFw3C/cpAf7sVfbdwiUvVkB5seYwf80
 GLhK9FJFe7CDZ39sIwO6N/uKHo4n7pFs2YhYnrcRxk//GP04lnxFHBoOT/FCxQDdkCVhddU+FNB
 8X65c3ZhFEMIf6SoBki04pf3+hfsMVH1OavfSpOBhY8flXhNeYptxeyGYLKNrZjqgWI1v8Dfb7a
 PM15nNwLjPHBHTm1DGiRnfyfWdb0DCUYxLsnez3puQy6Kbk/v1b8WOPbDKZlOC/oJrleC1Bfqt1
 b32VlCBNTur9ObWCejA==
X-Proofpoint-GUID: nDd76xnk9Um5yWgHm2gDHnsM6aj6IWfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040040

On 26-11-04 00:03:34, Peter Chen wrote:
> On 26-11-04 02:15:03, Wentao Liang wrote:
> > __cdnsp_gadget_init() takes a runtime PM reference with
> > pm_runtime_get_sync().  On success the reference is dropped by
> > cdnsp_gadget_exit(), which the role core only calls once the role state
> > has been set to active.  The failure paths return before that, so the
> > reference is leaked.
> > 
> > Drop the reference on the common error path.
> > 
> > Fixes: 3d82904559f4 ("usb: cdnsp: cdns3 Add main part of Cadence USBSSP DRD Driver")
> > Cc: stable@vger.kernel.org
> > Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> > Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> 
> Acked-by: Peter Chen <peter.chen@kernel.org>


Hi Greg,

Please drop my ack, I did not consider the situations bot reported.

Peter

> > ---
> >  drivers/usb/cdns3/cdnsp-gadget.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
> > index e84405352caa..d3df4bc4a17b 100644
> > --- a/drivers/usb/cdns3/cdnsp-gadget.c
> > +++ b/drivers/usb/cdns3/cdnsp-gadget.c
> > @@ -2083,6 +2083,7 @@ static int __cdnsp_gadget_init(struct cdns *cdns)
> >  free_setup:
> >  	kfree(pdev->setup_buf);
> >  free_pdev:
> > +	pm_runtime_put_autosuspend(cdns->dev);
> >  	kfree(pdev);
> >  
> >  	return ret;
> > -- 
> > 2.34.1
> > 
> > 
> 
> -- 
> 
> Thanks,
> Peter Chen

-- 

Thanks,
Peter Chen
