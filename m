Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A70131A807
	for <linux-usb@vger.kernel.org>; Sat,  3 Oct 2026 04:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791001353; cv=none; b=jFC9KOxhe6jP8t2o+F6jZLeUqdnZVgjNSOML9SV53r64BVhGGBMD2S6kVH0p/59xOE6ZUYdCL9rue7SdLT34vNgXXLBNj8USJK0SRf/IwcYaXHrxJxjkO7UdjCuCyrr4JNz+3ZUmu6T30aRKoaZSRFeihE5A0Y0sYidv7nS4itE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791001353; c=relaxed/simple;
	bh=DD4FDKqDe5MLZbpoPD6Fuf26hrheV72HpMXR6Lc65pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzt89loWcywBbPsePae8ww/DBKFF6CiZO/EE1TzBtvGHLZZOeaUa223ETtmZ15UC5wL0l2ZdpF+rT97QIhnp4lKujGH+5bcNdvnZVbmK/SkvfGeepIxEe78fJ7EoIv26reRk9YYJdJbJzTw9P5gWhpC/PCb0N21wEfWetnU6YCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+4TwNA2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhgAoW0Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+4TwNA2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhgAoW0Q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933PT9M145475
	for <linux-usb@vger.kernel.org>; Sat, 3 Oct 2026 04:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GPPhG3McnxH7twP/0eHwBUr1
	k8vDDtjVagOk1VrRcHA=; b=m+4TwNA2GEIgrj8jjh8dcCFH/XtltGie2mlLI3ob
	uGTL0u4z7w6PehJZenTVf61k0Em0a4eYPjy1qcQNTE9Mt+oVEnU2Knxp+b35uidY
	W2bS67Mmdv6ZIe66W4ZU/z+iHOdVf9CXdomkbuBRuG+bvInlhR7lRHcXhK2PX45p
	xWSXAl7m61SUJOyDy5L8bPllGlZu2NuzsW5xD3nAviZWj67oyAHMwbLihnALHedz
	M//JTsYqYXTXTOtxiWFjHhr+r2KE/9z2xxmNWV3az/AVL1VRHN0cvtqAjrSfjXtn
	JYwZIDfHt3VeakJCQ8ZI/QS6+i2lEXBHvjL+sIZdToGKrQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssg2nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 03 Oct 2026 04:22:31 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so42191c88.0
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 21:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791001350; x=1791606150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GPPhG3McnxH7twP/0eHwBUr1k8vDDtjVagOk1VrRcHA=;
        b=IhgAoW0Q/b/y93aAJjkuOV1enN38UYYuKz2T3EXuits7nfJExBS3ZirmkTiGFYy8Az
         /d1vSnjj+p/BkDNyRs34l/+flklhmc79eOrQZvk9hPYfEjhZP/hsM3n4gaDIPExK1qts
         dK/CBGCwjdHlXXvjBfljfB82wIkSyoimlDFGseneamIxlriSQg2ulWpX/JIDIv0VdXM8
         FzVtGHFRx6RCRO3Mi3PxUsOpr7udcQHbntWEywfpKYIn/XerE0ttbehgtWI80ZJ/aN7i
         y7GGNLRsqsLbKiIw46xK8VG3lOjLuRVm/zFochLDqCHQhsW2aBLScX6bRelrj/4xQBsu
         /kBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791001350; x=1791606150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPPhG3McnxH7twP/0eHwBUr1k8vDDtjVagOk1VrRcHA=;
        b=1kxgf/6bI+FgtMa8Su5XaZvtB9DVEusJcTxm3pmkN25oi2zzJvqEFUYcte/T7kHk84
         VzkSMrdVcbE4zlseoYS/y7Phos+OpjHRkp3mhggfSrnuHfZzfDx5TkpTFyZe0l0pFvBY
         HkzIec/LmVx5xDkIB+ibKwd0cRrz5yvSFTGqrrU6bW6vYOJFIbZnKe4mO1BsxO09B0EN
         KCsR9fWMD++7wnrqv6d4JyfML6c7SWtkbZB3oV5ERfvFkiDx+yizQP005vE+Oh+1g/as
         VpvTccvddwdySSCM3tjDr4e6QW5hEpT4/16O5KMmID2eLvLERRKrUl57/eXGOv9+uskV
         i8hQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/4L1nrZhZI1V3Ntj4YjUby+yOwER80lL00q+eI54MW40s/hjMne1zIR6XItEuUioBq3rOvdN4Gss=@vger.kernel.org
X-Gm-Message-State: AFuF++nEckPKBG7zKL32NhQ8uOEbGj6DhK+vPtFaNWeMXLuV82/jsF/P
	VfJQ5sRzHRXfwRRNCLQ4FB/HBxZ+XzWno2Ok9bD6u5GQQ0wEkj9HJaSp3O17TuCC3uUg0CLhjNX
	yjoQGrgns5OfLwEH1A+8DAUZdsB7C9N9lcOzAcUNU4uYSfVjy/aTO10IgHO5IlxGyQYzvEis=
X-Gm-Gg: AYBFou1cFixXmUtGPjUaKz53fGSH171QGhvsiBeVQi3B4Hsl+NK5+D2oVmNTlZvZjb5
	L3Wc7zbwms+aFazYnTDmkUxDvoO9li7Gw6/JiE/bn9nUI9vB3sTl0GXU4GuCy+76EOtfv9ouFgN
	E36dYldO4K8iRaaiU0EHzOz5Jn477RpAn3NjA82wuNHByXfSDyYNm/fjKQHFJBnFNd3TB9L9vl1
	7n3wmZHEyz3uBhaI+5C0hEtNpZtEbtvVn6TzYpc6/bYDvO/q56UETS+gJ9GaGpfQxKDLRXcwnqd
	h7aDXC4wL7V+ybN3AJFuGl5VueC9Yk6cOMRJpzf53YCxl81ELlmFIwtvij7DSYmrabvCtBV+VLC
	+IUDsZAF+MgqrMueg2Dp0HGG3SXxwEn7p3JxFMV4fcA==
X-Received: by 2002:a05:701b:280e:b0:14d:523b:ce86 with SMTP id a92af1059eb24-14f5bffb067mr251786c88.20.1791001350545;
        Fri, 02 Oct 2026 21:22:30 -0700 (PDT)
X-Received: by 2002:a05:701b:280e:b0:14d:523b:ce86 with SMTP id a92af1059eb24-14f5bffb067mr251748c88.20.1791001349894;
        Fri, 02 Oct 2026 21:22:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa74fa1csm2061919c88.1.2026.10.02.21.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 21:22:29 -0700 (PDT)
Date: Sat, 3 Oct 2026 12:22:23 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] usb: typec: Add onsemi FUSB15201 support
Message-ID: <asCC_0bS8nkFMyB4@QCOM-aGQu4IUr3Y>
References: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAxNyBTYWx0ZWRfX+m1s3UL9bFP6
 BJkxNpLForzJ8N7IiOy/svF34zy4I6yCzvdhYdrKm6xdYIs8ZCkJqssGXVMmc7blCnzfnXgRqI+
 N2UnIbB2LxkeAC/af1wce1zvEAH5vQA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAxNyBTYWx0ZWRfX9Hb0X9vijs1N
 jR18Eu9+1+5C6si/zcValozkgQsRAAYMNxUVpqCpyxhLE+53WpTugMC4Yfvehz8jUQvCJgP+q6S
 NlrKq5nQaKRq26CDkeBCBW/UozBp4u5xKRRYY83bGNdnS4MGvoB4r2S1y66ut4H9cvsl6uKb/4J
 Mv9E1oO2Ks30SfMKSajQoQCaldMVozXjbwCinJxmBY+zrtxGD2efA5hMiWIb1PuTtESBNuKdGDb
 wXEYLxJrPN9xXBkqTXTl/GsajdG5gEgA2KRKLPc/F0avMel3Ne5lg2kj9rZs+4YbdubvHQDCkrt
 3sd1Eo8w1q+k3TmodishE6z/sHn3qPmmRQf7/lyiu/5Uc9/AbNW3487q9Hcw74B+3vlD7XudJVN
 OflzjN/SeoCuYtdXSCVwRqDoNw0Ar+B8rqzvTr0YoZKzwmXxyBzMGIrmB8BVHnuO40a/9vztNAP
 Evy2aO1Ml3ARkdNe8qA==
X-Proofpoint-GUID: QHxmwLZ9nLFuDlTW60K_1KMDE735WsVb
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac08307 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z1MyDP9Hqjn3o93XXZQA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: QHxmwLZ9nLFuDlTW60K_1KMDE735WsVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030017

On Wed, Sep 16, 2026 at 09:59:16PM +0800, Shawn Guo wrote:
> The series adds a driver/binding for onsemi FUSB15201 which can be found
> on Qualcomm Nord reference design boards as a dual-port USB Type-C
> controller.
> 
> Changes for v3:
> - Address Heikki's review comments (Thanks Heikki!)
> - Link to v2: https://lore.kernel.org/all/20260911073414.16711-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes for v2:
> - Drop include of <linux/mod_devicetable.h>
> - Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/
> 
> Shawn Guo (2):
>   dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
>   usb: typec: Add onsemi FUSB15201 driver

Hi Greg,

How does this look to you? Would you consider to queue it up for 7.4
merge window?

Shawn
