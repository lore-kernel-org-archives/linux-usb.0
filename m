Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC64246AA6B
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791194304; cv=none; b=lW6rc2nvdlLoe4BTY1Px1vfjI7jwm0Mq1s423vN+CfJ7KE4sBu0y2ibOp+bS+CXJ2BFYRcqujqB4CfHd2Qf53QL2XD0LWAaV0/jgsBVTXixToAqKtEWDU+PGCCjeDUEx205sIzR38GjxJKstcBElXieet6vtKFgb75c/VAPvThE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791194304; c=relaxed/simple;
	bh=Ex6nOVVvmGAaran5IIX8Up3FAAKN9ayJOTZR1L631sI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UfQoZYXAeb6BZTl316vneiogWQ9J7DLKYqC3rfx27VuM+s0NTRZX++GhFmtQnEWQ48XzWTj4fFztbd7N+D6rtIb2lYsiIFtM+YlDSS++lRNqQ/BTXmBfeDpRqCrJTWtAN/E2lmYWyHTlYpLvcipsIsmbACdINqar67e4BA8OBms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+hBaZhM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHbOtpuI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+hBaZhM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHbOtpuI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xve52474649
	for <linux-usb@vger.kernel.org>; Mon, 5 Oct 2026 09:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/u+UehkU+tretpq4sz6osKKH5NHRrZvK6AoqRR3sDcA=; b=U+hBaZhMN0rqvtdT
	IHPuYhZnnyXGIttWg+y58jOEU9N7sI3NYlaRT/1FXe8Q+C9xNWrjpm0yvAAXGDRv
	b3NuhkR1X4yXbq5yaekFq6MdIwZyoIUlPy2+ao592WRDnGp/fJh9dDgLGCLOWowb
	nZSfigJApwA4ewGzmEHmwHbduJT092xW9ddBcxsSL4S2QEIjvbx01QL2vtfVjaRU
	EfBFihutqJVQdj4ri+hhhi5ANdmCkdGCoT5HFlr6wsH6oaCZKVFIMZ8IsQ/S7X+D
	MGCEjfg3biYACDdRWC3X6CUftF6kwHftNsWXJORGjaewNcnoy6+YbMDx6urloh8K
	D3FyFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssnau0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2026 09:58:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0be20102fso1565752a91.0
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2026 02:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791194302; x=1791799102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/u+UehkU+tretpq4sz6osKKH5NHRrZvK6AoqRR3sDcA=;
        b=jHbOtpuIliG5L1Wm4MxUGQ1vXXAyU5SiNJCZXmHfU4/yhVypRJA3xUZG5KBCz7I0m+
         2dvrhiD6OjCsrgtA6YS+oThRhWWzIA8bMHMSNm24wIE2lXCwcq8OsgVtPqXQfUynvuqy
         TxZOkE5w7s7X0+5SydpK8aKjAV72jbnjvk5iq7ICaglxED0DLo0j/e0R0iiHcimjGa7G
         vcya6mKRqh94Ia5yVHscI16MOrhytbHCOdY0ybkW1SNiPjNsd0fX1MlyjnxdGLl8rGqa
         wx5Kk8+Zuj8z7sSAG01V5k5qC0KlJSPc1uVMiZ6Fd4LW93A0BweduihjY2hTyY+7nD1j
         VOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791194302; x=1791799102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/u+UehkU+tretpq4sz6osKKH5NHRrZvK6AoqRR3sDcA=;
        b=gUpBQxL1gP7WHFjjYafF+tQ9RIKOJaXtCOaW+TPMhnALiQHfMgbiy/nSl+qRZMP6sb
         ZkHZJXfnYrOVwxZJRblwpWZgh5isCas5Lu2UDoGku1k+LQ44c8QPmGInztT32EsnBGpG
         3Ap+yQA9IrCwS57LJWtormNSdrIzoqPi0giesoL4nN6BahqS5c9zY+v5u1xbRu8HR6RK
         7IVaEL/gZ/FnJSAAYiWgvbVi0onWgkn4KjvKKSYskApz4qAjmAWK2vyD5TXzqj//iPrb
         fj5xfTQjUVYfTjn0q7kDT+cM2t8D+9H6w5X50bkTEMJl1SOLtP8n+612h4Jdd9j6QhSI
         U0tQ==
X-Gm-Message-State: AFq9FYI4jAPzYdUPGKSVT9aaRunko+jwXFtQ3nx5F5pdqNM0kEjW36PF
	yKxmYvKIXoXAorrALF+quhvFFbtYSfdke7J7WIdmi2H+hQG1SESilwR7XVqZmx9PUaxukywyMoz
	1EHQhhBm0yL+9cZRTO3T+S4UylKAgqJ0ISPKyM8QYYFWgy1c60t+6vSy9PBZmLtE=
X-Gm-Gg: AYBFou2JFU39Rnt+tKnEBBMtXJQhh+AL74jLIMqWp1btWpiqrBBIUVfX2SVgPnOn9BT
	hmGVRhN7z27Epnt10F3zS78Tz6sQA+toX3v7Gk+xOVaqQ80lA7lKKXBvw9sCkFZpd620IlR6MC0
	UYiRhJvvHLg3IwmWc3rxnnjBujdRmdIKYYN3y8TFHvqn7jtRgmXDdySljTu8nIXLyPrLK+V6LB2
	nPANQsLSB08LEMvnEVYS8kIMbn0kELzjsyDNJy3JYdT776EFh89g7tVC/uJ33dqQXhCOoXzUUjz
	NLuDIflWsPl/+8BDZ5ZJNlBcX2ARycY1yCmqWA5gS4XYt9nPHuHdwC4baswgTha0Uo/RQZMox1E
	2YQPgARBBRFPO2/7Gvhv4N/tMiMvwd99HGyR763/tZzFRSMpU1n74MLBUXgtejGbmZKFFAQpCwc
	+QNLiNnZWW5fAicauWkQ==
X-Received: by 2002:a17:90b:35d1:b0:3a0:8050:2ed4 with SMTP id 98e67ed59e1d1-3a78717db25mr5767123a91.17.1791194302126;
        Mon, 05 Oct 2026 02:58:22 -0700 (PDT)
X-Received: by 2002:a17:90b:35d1:b0:3a0:8050:2ed4 with SMTP id 98e67ed59e1d1-3a78717db25mr5767105a91.17.1791194301633;
        Mon, 05 Oct 2026 02:58:21 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d7cd47csm10690344a91.17.2026.10.05.02.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:58:21 -0700 (PDT)
Message-ID: <4df14aca-eef0-497a-871f-bea4700c74d8@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 15:28:17 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a host
 with wakeup
To: fabricioakio@gmail.com, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX01fW3ymoPdwn
 aAQ4vEDcEHwEG53RNEYfg5lTowxC0FLjs28Zk/d+VGItEqx4groqX+PrfngoqaEW+AgicEad2ep
 nqLHOgplN00+kQznIrjEUbDT0wj1w1g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzOSBTYWx0ZWRfX+Nz3EBzkjWYJ
 g5mDVNqp7THtKdM0tIOllQ0hhRzkHWpDByC02n4quKDD4XOA+9JkI6eJUrRVjTAIuCpPiwe3+nl
 eXCvl0nNY8A3Fh8TAn9QsWuunrfbEKqjpZTGVUacqU7OHako/WiDHBkLa3GSv1m+KQTctJvAgBR
 WLZ4deo26aYTpkHQnxyGupbnR/YV9GgAa1Nhu3IbQ6DvhBExBto9yGnTu49FWEwEfIDKVpRHFDA
 mUlbqOI67X/0gwFm/6kx1bGHVe+Oa5qMosN3Saj1vpv9NpKdzsB0zTX+Cbx4iqbTRdhW/kE1saa
 LTG8r43SGeD0rx9UR7GJdS3G8xOPQdwAlc2GnoI4G6ZW3SmzaxOJtf4pwmlTOqrBLyLGn/z7Loh
 rW3twOG6kcZB+pdKAphSyF7UF4+Cl1HJd2BdOQGPK1mtlLaXgdNt1kaPlGDByyj4CrC05vlmkgf
 1IX1Aeczl8u8A6z/yLA==
X-Proofpoint-GUID: RU-qGqFHa4ddzF0fDEqdSxq-Yx4rsByU
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac374be cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=QFNGBFAix9GFkXGs:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Yc3q67t5xzoVBN05MFIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: RU-qGqFHa4ddzF0fDEqdSxq-Yx4rsByU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050039

On 9/28/2026 11:46 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> In peripheral mode the core disconnects and powers the PHY off before
> the glue suspends, so the link never enters L2 and every system
> suspend logs "HS-PHY not in L2". Check only for a host with wakeup,
> the one case that parks the PHY in L2.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on a Motorola Moto X4 (XT1900-6, SDM630) with the sdm660-mainline
> 7.2.3 tree, in peripheral mode with the cable attached: the "HS-PHY not
> in L2" message appears on every system suspend without this patch, and
> not over three consecutive cycles with it. Host mode is untested, since
> this board runs the controller in peripheral mode. The board binds
> dwc3-qcom-legacy, so the same change in dwc3-qcom.c is build-tested
> only. Applies unchanged to next-20260928.
> ---
Tested on Glymur-CRD
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

[...]
