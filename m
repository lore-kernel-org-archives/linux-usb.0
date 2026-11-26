Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686893;
	b=czltD8HUeBlo6hep37fU++sHehaldDKZ22K5CmJU32YQAtqvK+Z3vj9eJpM+kXCwS0DI
	 LgKECnjb/BtC6OpYD7RxtCPcfIQVQjkJIXWbn1Xyd26zBcQPCHjXZAvo+CE1L0/8tafSp
	 Iu1HPdsLIYJHjHz1qMtheuSrPDPTNhK8j2q/91WtXdh/yOrOnfLzOkKt0w+r7IeOEeLQq
	 /g96HUsXYTu7eRuzssV13vqlDr0pq1TRvOOetSB50IAlY5DiwNEHwpFeY72knU8HGMxjZ
	 2l9k3CKuEn+y5bkGcp4f2sU7x57Kag797XL8ZzjIPBlhHvgMOZT3drRvzF9zB/2Rj2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kdx3A01MCHfzKvhg6F0IDQCh+hcLdzZP3RW8GaIG51Y=;
	b=S5QB2Bdq7H1A+qxDabF94W5thMoqaMBhMWM9nIW9imMiMive+dnipHovSjFwQ9bfglDV
	 NzwfGj8wzH5vuDEHTdm4JLzUNxfCqWGyvddqVynUnSO+/vTy7X7JDYrrj2wqjHsDe5c9c
	 wcl/cuncqoQarZ5hHb7+s1vLUcycUXY2FRglTHT6YFh18zQK1E2D3hcT+30vpj2Ud1l5f
	 80g+YY0mecr5FYgWwTlqY9PwJo9N7jtpwE6l7AQYB77MBgiguSdVaz4n4CPcI2UxoV6dZ
	 i54PxYsdDTSYRuTu8ol0xZNPG5lNPQhz+dHN7NvWSOlaBs+HKGn4Ok//foEztDTDMAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQFc0EDi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JeAEFP6y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD01606A321
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD01606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQFc0EDi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JeAEFP6y
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Ar0Y2885415
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kdx3A01MCHfzKvhg6F0IDQCh
	+hcLdzZP3RW8GaIG51Y=; b=hQFc0EDiTPqXE7kwdzQTEPaHnmIXWz979peW16gD
	O0GOiYtjeORCvlpsScpsJkTWRMOJqQWkutpOfsfzli45j6SaydbSQJf9bmxaHBMX
	w6SCkc0Ty9t68lnVBbx27juVGfv4V6xMYGUzVKo5PC8WgFoCAhVTEMCmlK57Jmxj
	b/IR6tF3fto7WruC9oZmpwbU2u/2BLHA7uo11udqhO0YjKRX+5lW2Q9RIRUrT+gk
	4YLaFj6oNh6M5yaCd3HokghKd2UdFt5xjZCtxlCG10RhusyUXsr55VCc8vx4GlkY
	u2Bj8tzOj17i3WWbIOJHfe57ZDitnXRVqiDd1l5iG5Jn2A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgv7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:54:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a5005fd0f8so6182835c88.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 01:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686892; x=1796291692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdx3A01MCHfzKvhg6F0IDQCh+hcLdzZP3RW8GaIG51Y=;
        b=JeAEFP6ylE8rXHTIvD0QRiEWN67zOk9bEHakf6vMrijmjLKWT3wQ+yn1fIiWPlNEqo
         mYhqIixu0MXzvg7wXpstgXLXUPLwKbBzKxU7DcNRinV9esLb2wMLnLpK8okOI35h4WKr
         AhuLO9IukBfzkAyFuipW1cJl36pSfuGfQJrgWB+n3K26Jmeovq9DB2JiU0qNcti7E/MG
         u3wqsQfGbKQMN7b1WR7eCBK2YHm8kRBIyYxT82dEhBUR3CgcrO4j2aV/nl9Ey2tuV5MS
         P8XBfNO15alpxa4cxHIhIVRIOMQDBDsRLmXO3COI6Cowz9M5Q/VA4s1OGvxMMtsBLXGk
         iG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686892; x=1796291692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdx3A01MCHfzKvhg6F0IDQCh+hcLdzZP3RW8GaIG51Y=;
        b=1D8kAxwu2cOHm299CyJI2A6ebSjA3u0Vii5NlD7e0Id/pSN935G/GUBbssVs+5L+Ha
         riadLuhwlhVPkRvSMmvJYeohnfssjMcnrRii1qms3O5w6kn8Bb6nkrrotM4BhYQ6LKOx
         DteSg+teNWb5rNmPbG9xKkHK5xBCY7eEVsOyrSYuWf9e3B5SpJJ+DXHEoagp41gqsWiU
         Bw0zmDRcm1AUJrGzxGeH+XfkIY0WGluEbfXjTeaqJUFhdRlQduQf0Yo6o13eXYmcbKqv
         Zg5Tg4bpWWbic9i0qYCdj0wQxoOMEN8lclV5yAK2Bm9zhMI74pKgJ6b67/37EK58Wr3q
         8rNQ==
X-Forwarded-Encrypted: i=1; AL+hErHUsPSVyz3BRXCBQb+mRsHpqe71hmCudHXx/vWhSAKthzvJQT7IaOmCozh+26G2jTxjbiDHNIGQRw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iqEYXSEwens+ZjG1VIh+IjHvGaxIlnYP9q0H8B4+ybR6Z0+vX
	RgeaiIhrBXE+lmqUvavUsbR2iOXvSUaF2AyMqGk5pLiyggYYcsiYDrFFh56uHQxJrXmsRcc+UFR
	ks+1TavHENv9kz0poXSSY0p37uH3uzw4CAGddVkpcvNfXRMZCH+4xBT2r/k+vIQLS8+N4OP5WGA
	==
X-Gm-Gg: AZFdTZerJqgbDGHXktkY+tq/IG2It2JLNr12i+ahjYPLzknX12zu/4WhWjzHe0HxAA1
	CCpjfJGd6MwRgQCxMpBpfhmV1xYaSUXACuyhYOrU2R0TUcOH/jG1dG/J6VPshsD8KlVTTsH2wf0
	/zcYon71DQ5FbByQheN8cpx/LJErbAw1q+UiF/3v4TYWamdZsRSNxRSe1pBfs/kNf2oN5hCN/Ji
	Fol8Cq0biQH+fDBVjnA/i0y1f/b21LkVqM1YciBeiJt8LBKw0TPl3GBXEoz3Ns0YF08l35Pu4io
	bOrBA585PMghXVLlCkS2EzfVj2Qk0OUgRe412jbqIGzW1mo1UGbjB7evT5qQTy4+YHwfrWKP5Ps
	D/TksIXeYEWRNOeZhjv5x2IF+z4+7umjehXCcL0caZmRQpdxzu3yoXt1jCIw9Vq+2VwsEmxdN9/
	LqRCvBYJf5kQgyS1s+nKF7CM0=
X-Received: by 2002:a05:701a:844d:10b0:1b5:888a:a1ab with SMTP id a92af1059eb24-1b5888aa35bmr5577036c88.15.1795686892027;
        Thu, 26 Nov 2026 01:54:52 -0800 (PST)
X-Received: by 2002:a05:701a:844d:10b0:1b5:888a:a1ab with SMTP id a92af1059eb24-1b5888aa35bmr5577003c88.15.1795686891362;
        Thu, 26 Nov 2026 01:54:51 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm48932950c88.10.2026.11.26.01.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:54:51 -0800 (PST)
Date: Thu, 26 Nov 2026 01:54:49 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/11] usb: dwc3: qcom: Restore VBUS override after
 system resume
Message-ID: <awgB6a2rwB1auFpQ@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX6zRsVTIBJWaz
 IkCnJypB8Z/02l3FxA1WJn1JLEexGc/saGpbd5nbXgYB94rqTNR5e/I6/E9vaP6xJoPz7FJLGRT
 D4t9TgB9kHgQ2683Jb3md3HEkgcMAEtRA2gYBt0qzgFLuT7nVOBKe2UoKDriTQrglhBBw+rh/UH
 5WETiBY7sVwtUZGWc1tly5ff+3EDMitpy0hN1DS8UKkQ3oN9CAZ07C3g7g9kePiraLVgHSCmfNN
 gTWRRGni44cQMWGgcPNA5WzgbGWowa2Y1sVxfn3d2HP5B01/G8ckAB5MvT6mSM1jKgeFi9aT2XH
 v91IecYpYLUxoppPO3AaXzqyk6/y8DhVam0AcGzSRirfQcJ2d0+uJ0kSDVpTUb+VrCgqRwNnvC3
 INBN7gWNqic00jSigUmaRDTmnmygWSCPiqrPfAwS4W8kxjUYSR7uhkfvg19IS/13lvZ3dl52y9a
 8x+kYMPNJppBdeIBKVA==
X-Proofpoint-GUID: -4_K3dN0fbY4Cn3ORerTK2H6oc3cWLpw
X-Proofpoint-ORIG-GUID: -4_K3dN0fbY4Cn3ORerTK2H6oc3cWLpw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX0eh+OX7Mo4IU
 NiAPj1DhxTZmgsguIZO1ynhfulqw7e1o7IoXVviojDOqLQP6SpC4m2FBDgcO6REWEq23iBqMGOs
 ocQ3L7ASd7hr0UImC6RVmx/YA2T7jsE=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b0801ec cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2q1QCJqqa6WVGGjbUB4A:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

On 26-11-23 16:17:23, Faisal Hassan wrote:
> The controller reset on system resume returns the Qscratch registers to
> their power-on defaults, which clears the VBUS valid override that was
> set up for device mode. Without it the PHY does not see VBUS and the
> gadget fails to enumerate after resume.
> 
> Re-enable the override after resume when the controller is not in host
> mode.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 8e8d7e59c6d5..50fca06c83d4 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -457,6 +457,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
>  	}
>  
> +	/*
> +	 * The reset above returned Qscratch to its power-on defaults, so
> +	 * restore the VBUS valid override set up for device mode.
> +	 */
> +	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg) &&
> +	    !dwc3_qcom_is_host(qcom))
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>  	qcom->is_suspended = false;
>  

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

-- 

Thanks,
Peter Chen
